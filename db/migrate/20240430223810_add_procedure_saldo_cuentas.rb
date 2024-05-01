class AddProcedureSaldoCuentas < ActiveRecord::Migration[7.0]
  # crear procedimiento almacenado saldo cuentas
  def up
    execute <<~SQL
        CREATE PROCEDURE [dbo].[PA_SALDOS_CUENTAS]
        (
        @ejercicio_fiscal int= 2023,
        @mes int =4,
        @isSaldos bit = 0
      )
      AS
      BEGIN

        SET NOCOUNT ON;

        create table #PERIODOS
        (
          id int,
          mes_id int,
          mes_nombre varchar(11),
          numero_quincena int,
          quincena_id int,
          fecha_inicio date,
          fecha_fin date,
          nombre varchar(200)
        )

        insert into #PERIODOS
        exec PA_OBTENER_PERIODOS @ejercicio_fiscal = @ejercicio_fiscal, @mes = @mes

        /* *********************************************************************************************************************************************************************************/
        create table #final_data
        (
          cuenta_id bigint,
          periodo_id int,
          importe money
        )

        insert into #final_data
          (cuenta_id, periodo_id, importe)
        select registros.cuenta_id, periodos.id periodo_id, sum(registros.importe) importe
        from registros
          left join #PERIODOS periodos on registros.fecha <= periodos.fecha_fin
        group by registros.cuenta_id, periodos.id

        SELECT cuenta_id,
          [0], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24]
        into #reporte_pre
        FROM
          (
            select *
          from #final_data
        ) AS SourceTable
        PIVOT
        (
          sum(importe)
          FOR periodo_id IN ([0], [1], [2], [3], [4], [5], [6], [7],[8], [9], [10], [11], [12], [13], [14], [15],[16], [17], [18], [19], [20], [21], [22], [23],[24])
        ) AS PivotTable;


        /* *********************************************************************************************************************************************************************************/

        select '' icono, cuentas.nombre nombre_categoria, cuentas.tipo_cuenta_id/*, categorias.orden*/, r.*
        from #reporte_pre r
          left join cuentas on r.cuenta_id = cuentas.id
        order by cuentas.id asc


        drop table IF EXISTS #data_final_egreso
        drop table IF EXISTS #data_final_ingreso
        drop table IF EXISTS #final_data
        drop table IF EXISTS #PERIODOS

        if(@isSaldos = 0) begin
          drop table #reporte_pre
        end else BEGIN
          drop table if EXISTS  #reporte_pre_saldos
          drop table IF EXISTS #data_final_saldos
        end
      end
    SQL
  end
end
