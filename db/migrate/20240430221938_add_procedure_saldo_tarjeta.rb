class AddProcedureSaldoTarjeta < ActiveRecord::Migration[7.0]
  # crear procedimiento almacenado
  def up
    execute <<~SQL
      CREATE PROCEDURE [dbo].[PA_SALDO_TARJETA]
      (
        @cuenta_id bigint = 6,
        @fecha_final  date = '20231021',
        @is_detalle bit = 1
        )
      AS
      BEGIN

      SET NOCOUNT ON;

        drop table if exists #data

        drop table if EXISTS #movimientos
        select fecha, case when day(fecha) = day(@fecha_final) then DATEADD(day, 1, @fecha_final) else @fecha_final end fechaFinal
          , importe, numero_msi, concepto, categorias.nombre nombre_categoria
        into #movimientos
        from registros_tarjeta rj
        join categorias on rj.categoria_id = categorias.id
        where cuenta_id = @cuenta_id
        and fecha <= @fecha_final
        and is_msi > 0

      select m.*
                ,round(datediff(month, fecha, fechaFinal) - 1 +
                                        1-1.0*(day(Fecha)-1)/ day(dateadd(m, datediff(m,-1, Fecha), -1))
                                        + 1.0*(day(fechaFinal)-1)/ day(dateadd(m, datediff(m,-1, fechaFinal), -1)),0,1) meses
                into #data
            from #movimientos m

          select  fecha, fechaFinal, nombre_categoria, concepto,  importe, numero_msi ,meses meses_trascurridos
          ,  round(importe-((importe/numero_msi)* meses),6,0) importe_saldo
            into #reporte
          from #data
          where meses >= 0
          and meses < numero_msi

        select fecha, c.nombre nombre_categoria, concepto, importe, 0 numero_msi, 0 meses_trascurridos, importe  saldo
           into #movimientos_no_msi
        from registros_tarjeta rt
        join categorias c on rt.categoria_id = c.id
        join estados_registro_tarjeta ert on rt.estado_registro_tarjeta_id = ert.id
        where cuenta_id = @cuenta_id 
        and fecha <= @fecha_final -- menor o igual a la fecha final
        and is_msi <= 0 --No es un movimientos de meses sin intereses
        and estado_registro_tarjeta_id = 1 --Pendiente

            if (@is_detalle > 0) BEGIN
                select fecha, nombre_categoria, concepto, importe, numero_msi, meses_trascurridos, importe_saldo
                from #reporte
                 union all
                select fecha, nombre_categoria, concepto, importe, numero_msi, meses_trascurridos, importe importe_saldo
                from #movimientos_no_msi
            end else begin
                select coalesce(sum(saldo),0) saldo from(
                    select round(sum(importe_saldo),6,1) saldo
                    from #reporte
                     union all
                    select ROUND(sum(importe),6,1) importe
                    from #movimientos_no_msi
                )z
            end

            drop table if exists #data
            drop table if EXISTS #movimientos
            drop table if EXISTS #movimientos_no_msi
            drop table if EXISTS #reporte

      end
    SQL
  end
end
