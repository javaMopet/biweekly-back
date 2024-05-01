class AddProcedureIngresosEgresosSaldos < ActiveRecord::Migration[7.0]
  # crear procedimiento almacenado INGRESOS EGRESOS SALDOS
  def up
    execute <<~SQL
        CREATE PROCEDURE [dbo].[PA_INGRESOS_EGRESOS_SALDOS]
        (
          @ejercicio_fiscal int= 2023,
          @mes int =4)
      AS
      BEGIN
      -- EN ESTE PROCEDIMIENTO SE OBTIENEN DOS LINEA EL NET CASH POR PERIODO Y EL FINAL CASH BALANCE POR PERIODO
      SET NOCOUNT ON;
      create table #PERIODOS(id int, mes_id int, mes_nombre varchar(11), numero_quincena int, quincena_id int, fecha_inicio date, fecha_fin date, nombre varchar(200))

      insert into #PERIODOS
      exec PA_OBTENER_PERIODOS @ejercicio_fiscal = @ejercicio_fiscal, @mes = @mes

      create table #net_cash(clasificacion_id bigint, periodo_id int, importe money)

      insert into #net_cash(clasificacion_id, periodo_id, importe)
        select 1 clasificacion_id, periodos.id periodo_id, sum(registros.importe) importe
        from registros
          left join #PERIODOS periodos on registros.fecha BETWEEN periodos.fecha_inicio and periodos.fecha_fin
        group by registros.cuenta_id, periodos.id
      union all
        select 2 clasificacion_id , periodos.id periodo_id, sum(registros.importe) importe
        from registros
          left join #PERIODOS periodos on registros.fecha <= periodos.fecha_fin
        group by registros.cuenta_id, periodos.id

      -- select * from #net_cash

        SELECT clasificacion_id, [0], [1], [2], [3], [4], [5], [6], [7],[8], [9], [10], [11], [12], [13], [14], [15],[16], [17], [18], [19], [20], [21], [22], [23],[24]
          into #reporte_pre
        FROM
        (   select * from #net_cash ) AS SourceTable
        PIVOT
        (
          sum(importe)
          FOR periodo_id IN ([0], [1], [2], [3], [4], [5], [6], [7],[8], [9], [10], [11], [12], [13], [14], [15],[16], [17], [18], [19], [20], [21], [22], [23],[24])
        ) AS PivotTable;

      select ''icono,case clasificacion_id when 1 then 'Net cash proceds' when 2 then 'Final cash balance' ELSE '' end  nombre_categoria, clasificacion_id categoria_id
      , [0], [1], [2], [3], [4], [5], [6], [7],[8], [9], [10], [11], [12], [13], [14], [15],[16], [17], [18], [19], [20], [21], [22], [23],[24]
      from #reporte_pre
      order by clasificacion_id asc

      drop table #PERIODOS
      drop table #net_cash
      drop table #reporte_pre
      end
    SQL
  end
end
