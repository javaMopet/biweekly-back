class AddProcedureMovimientos < ActiveRecord::Migration[7.0]
  # crear procedimiento almacenado Movimientos
  def up
    execute <<~SQL
        CREATE PROCEDURE [dbo].[PA_MOVIMIENTOS]
      	(
          @ejercicio_fiscal int= null,
      		@mes int =null,
          @tipo_movimiento_id int = 2, --Egresos
          @isSaldos bit= 0
      	)
      AS
      BEGIN

      SET NOCOUNT ON;

      create table #PERIODOS(id int, mes_id int, mes_nombre varchar(11), numero_quincena int, quincena_id int, fecha_inicio date, fecha_fin date, nombre varchar(200))

      insert into #PERIODOS
      exec PA_OBTENER_PERIODOS @ejercicio_fiscal = @ejercicio_fiscal, @mes = @mes

      /* *********************************************************************************************************************************************************************************/
      IF (@isSaldos = 0) begin
        /* ****************** SE OBTIENEN TODOS LOS MOVIMIENTOS POR PERIODO Y POR CLASIFICACION POR TIPO DE MOVIMIENTO *********************** */
        select categorias.id categoria_id,  case @tipo_movimiento_id when 1 then registros.importe else registros.importe *-1 end importe,  periodos.id periodo_id
        into #data_final
        from categorias
        left join registros on categorias.id = registros.categoria_id
        left join #PERIODOS periodos on registros.fecha BETWEEN periodos.fecha_inicio and periodos.fecha_fin
        where categorias.tipo_movimiento_id = @tipo_movimiento_id

      END ELSE BEGIN
        /* ****************** SE OBTIENEN SOLO IMPORTE TOTAL DE MOVIMIENTOS *********************** */
        select sum(case @tipo_movimiento_id when 1 then registros.importe else registros.importe *-1 end) importe,  periodos.id periodo_id
        into #data_final_saldos
        from categorias
        left join registros on categorias.id = registros.categoria_id
        left join #PERIODOS periodos on registros.fecha BETWEEN periodos.fecha_inicio and periodos.fecha_fin
        where categorias.tipo_movimiento_id = @tipo_movimiento_id
        group by periodos.id

      end

      IF (@isSaldos = 0) begin
        SELECT categoria_id,
          [0], [1], [2], [3], [4], [5], [6], [7],[8], [9], [10], [11], [12], [13], [14], [15],[16], [17], [18], [19], [20], [21], [22], [23],[24]
          into #reporte_pre
        FROM
        (
            select * from #data_final
        ) AS SourceTable
        PIVOT
        (
          sum(importe)
          FOR periodo_id IN ([0], [1], [2], [3], [4], [5], [6], [7],[8], [9], [10], [11], [12], [13], [14], [15],[16], [17], [18], [19], [20], [21], [22], [23],[24])
        ) AS PivotTable

      END ELSE BEGIN

      SELECT
        [0], [1], [2], [3], [4], [5], [6], [7],[8], [9], [10], [11], [12], [13], [14], [15],[16], [17], [18], [19], [20], [21], [22], [23],[24]
        into #reporte_pre_saldos
      FROM
      (
          select * from #data_final_saldos
      ) AS SourceTable
      PIVOT
      (
        sum(importe)
        FOR periodo_id IN ([0], [1], [2], [3], [4], [5], [6], [7],[8], [9], [10], [11], [12], [13], [14], [15],[16], [17], [18], [19], [20], [21], [22], [23],[24])
      ) AS PivotTable;
      END
      /* *********************************************************************************************************************************************************************************/

      IF(@isSaldos = 0) BEGIN
      select categorias.icono, categorias.color, categorias.nombre nombre_categoria, categorias.tipo_movimiento_id, categorias.orden,r.*
      from #reporte_pre r
      left join categorias on r.categoria_id = categorias.id
      order by orden asc
      END ELSE BEGIN
      select  '' icono, '' color, 'TOTAL' nombre_categoria, '' tipo_movimiento_id, 100000 orden, null categoria_id,'saldos__1' classes, r.*
      from #reporte_pre_saldos r
      order by orden asc

      END
      IF(@isSaldos = 0 )BEGIN
        drop table #data_final
        drop table #reporte_pre
      END ELSE BEGIN
        drop table #data_final_saldos
        drop table #reporte_pre_saldos
      END


      drop table #PERIODOS

      end
    SQL
  end
end
