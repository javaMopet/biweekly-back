class AddProcedureReporteMovimientos < ActiveRecord::Migration[7.0]
  # crear procedimiento almacenado INGRESOS EGRESOS SALDOS
  def up
    execute <<~SQL
      CREATE PROCEDURE [dbo].[PA_REPORTE_MOVIMIENTOS](
        @ejercicio_fiscal int = 2024, @mes int = null, @instance_id int )
      AS
      BEGIN
        SET NOCOUNT ON;

        drop table if EXISTS #PERIODOS
        create table #PERIODOS(id int, mes_id int, mes_nombre varchar(11), numero_quincena int, quincena_id int, fecha_inicio date, fecha_fin date, nombre varchar(200))

        -- OBTENER PERIODOS DE TODO EL AÑO, (24 QUINCENAS)
        insert into #PERIODOS
        exec PA_OBTENER_PERIODOS @ejercicio_fiscal = @ejercicio_fiscal, @mes = @mes

        /* ****************** SE OBTIENEN TODOS LOS MOVIMIENTOS POR PERIODO Y POR CLASIFICACION POR TIPO DE MOVIMIENTO *********************** */
        /* *
        * * AQUI NO SE TOMAN EN CUENTA LOS TRASPASOS ENTRE CUENTAS
        */
        drop table if EXISTS #data_final
        select categorias.id categoria_id, categorias.nombre, categorias.tipo_movimiento_id
          , case categorias.tipo_movimiento_id
              when 1 then registros.importe
              else registros.importe *-1
              end importe
          , periodos.id periodo_id
        into #data_final
        from categorias
        left join registros on categorias.id = registros.categoria_id
        left join #PERIODOS periodos on registros.fecha BETWEEN periodos.fecha_inicio and periodos.fecha_fin
        where YEAR(registros.fecha) = @ejercicio_fiscal
        AND categorias.instance_id = @instance_id

        drop table if EXISTS #reporte_pre
        SELECT nombre, tipo_movimiento_id,
          [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24]
        into #reporte_pre
        FROM
          (      select *
          from #data_final  ) AS SourceTable
        PIVOT  (    sum(importe)    FOR periodo_id IN ([1], [2], [3], [4], [5], [6], [7],[8], [9], [10], [11], [12], [13], [14], [15],[16], [17], [18]
              , [19], [20], [21], [22], [23],[24])  ) AS PivotTable

        /* ************************* end *************************************/

      /**
      ** Procedemos a obtener los saldos finales de collections y disbursements y su balance entre si
      ** hacemos el join con cuentas debido a que no se toman en cuenta los traspasos entre cuentas
      **/
        drop table if EXISTS #net_cash
        create table #net_cash
        (
          clasificacion_id bigint,
          nombre varchar(50),
          periodo_id int,
          importe money
        )

        insert into #net_cash
          (clasificacion_id, nombre, periodo_id, importe)
            select 1 clasificacion_id, 'Net cash proceeds' nombre, periodos.id periodo_id, sum(registros.importe) importe
          from registros
          join categorias on registros.categoria_id = categorias.id
            left join #PERIODOS periodos on registros.fecha BETWEEN periodos.fecha_inicio and periodos.fecha_fin
          where categorias.instance_id = @instance_id
          group by registros.cuenta_id, periodos.id
        union all
          select 2 clasificacion_id, 'Final cash balance' nombre , periodos.id periodo_id, sum(registros.importe) importe
          from registros
          join categorias on registros.categoria_id = categorias.id
            left join #PERIODOS periodos on registros.fecha <= periodos.fecha_fin
          where categorias.instance_id = @instance_id
          group by registros.cuenta_id, periodos.id
        /*
          select * from #net_cash
       */
        drop table if EXISTS #reporte_pre_net_cash
        SELECT clasificacion_id,  nombre, [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24]
        into #reporte_pre_net_cash
        FROM
          (   select * from #net_cash ) AS SourceTable
        PIVOT
        (
          sum(importe)
          FOR periodo_id IN ([1], [2], [3], [4], [5], [6], [7],[8], [9], [10], [11], [12], [13], [14], [15],[16], [17], [18], [19], [20], [21], [22], [23],[24])
        ) AS PivotTable;
        /*
        select * from #reporte_pre_net_cash
        order by clasificacion_id asc
         */
        /**
        ** Obtenemos importe de cuentas bancarias y efectivo
        **/
        drop table if EXISTS #final_data
        create table #final_data(cuenta_id bigint, nombre varchar(150), periodo_id int, importe money)

        insert into #final_data(cuenta_id, nombre, periodo_id, importe)
          select registros.cuenta_id, cuentas.nombre, periodos.id periodo_id, sum(registros.importe) importe
          from registros
          join cuentas on registros.cuenta_id= cuentas.id
          left join #PERIODOS periodos on registros.fecha <= periodos.fecha_fin
          where cuentas.instance_id = @instance_id
          group by registros.cuenta_id, cuentas.nombre, periodos.id

        drop table if EXISTS #reporte_pre_saldos_cuentas
        SELECT cuenta_id, nombre,
          [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24]
        into #reporte_pre_saldos_cuentas
        FROM(
            select * from #final_data
        ) AS SourceTable
        PIVOT
        (
          sum(importe)
          FOR periodo_id IN ([1], [2], [3], [4], [5], [6], [7],[8], [9], [10], [11], [12], [13], [14], [15],[16], [17], [18], [19], [20], [21], [22], [23],[24])
        ) AS PivotTable;
        /*
        select * From #reporte_pre_saldos_cuentas
       */
       /* *************************************** end *********************************** */
        /* ************************************* SALDOS FINALES **************************************************** */

        create table #final_cash_balance
        (
          periodo_id int,
          importe money
        )
        create table #total_cash_bank_account
        (
          clasificacion_id bigint,
          periodo_id int,
          importe money
        )
        create table #net_balance
        (
          clasificacion_id bigint,
          periodo_id int,
          importe money
        )
        create table #final_data_sf
        (
          clasificacion_id bigint,
          periodo_id int,
          importe money
        )
        -- Revisar este por que ya se tiene anterioremente - Es el cash balance por categoria
        insert into #final_cash_balance(periodo_id, importe)
        select periodos.id periodo_id, sum(registros.importe) importe
        from registros
        join categorias on registros.categoria_id = categorias.id
        left join #PERIODOS periodos on registros.fecha <= periodos.fecha_fin
        where categorias.instance_id = @instance_id
        group by registros.cuenta_id, periodos.id

        insert into #total_cash_bank_account
          (clasificacion_id, periodo_id, importe)
        select 1 clasificacion_id, periodos.id periodo_id, sum(registros.importe) importe
        from registros
        join cuentas on registros.cuenta_id = cuentas.id
          left join #PERIODOS periodos on registros.fecha <= periodos.fecha_fin
        where cuentas.instance_id = @instance_id
        group by registros.cuenta_id, periodos.id

        insert into #net_balance
        select clasificacion, periodo_id, sum(importe) importe
        from (
            select 2 clasificacion, periodo_id, sum(importe) importe
            From #final_cash_balance
            group by periodo_id
          union all
            select 2 clasificacion, periodo_id, sum(importe*-1)
            from #total_cash_bank_account
            group by periodo_id
        )z
        group by clasificacion, periodo_id


        insert into #final_data_sf
          (clasificacion_id, periodo_id, importe)
        select clasificacion_id, periodo_id, importe
        from (
                  select *
            from #total_cash_bank_account
          union all
            select clasificacion_id, periodo_id, importe
            from #net_balance
        )data


        SELECT clasificacion_id, case clasificacion_id when 1 then 'Total Cash bank account'
          when 2 then 'Net Balance' end nombre, [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11]
          , [12], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24]
        into #reporte_pre_sf
        FROM
          (   select * from #final_data_sf ) AS SourceTable
        PIVOT
        (
          sum(importe)
          FOR periodo_id IN ( [1], [2], [3], [4], [5], [6], [7],[8], [9], [10], [11], [12], [13], [14], [15],[16], [17], [18], [19], [20], [21], [22], [23],[24])
        ) AS PivotTable;

        /* ********************* ************** ********************************************** */
        /* ********************* ************** ********************************************** */
        select 0 orden, 'Collections' nombre,null [1],null [2], null [3], null [4], null [5], null [6], null [7], null [8], null [9]
          , null [10], null [11], null [12], null [13], null [14], null [15], null [16], null [17], null [18], null [19]
          , null [20], null [21], null [22], null [23], null [24]
          into #reporte_final
          union all
        select 1 orden, nombre, [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24]
          from #reporte_pre
          where tipo_movimiento_id = 1
        union all
          select 2 orden,  'Total Collections' nombre, sum([1]) [1], sum([2]) [2], sum([3]) [3], sum([4]) [4], sum([5]) [5], sum([6]) [6], sum([7]) [7]
          , sum([8]) [8], sum([9]) [9], sum([10]) [10], sum([11]) [11], sum([12]) [12], sum([13]) [13], sum([14]) [14], sum([15]) [15]
          , sum([16]) [16], sum([17]) [17], sum([18]) [18], sum([19]) [19], sum([20]) [20], sum([21]) [21], sum([22]) [22]
          , sum([23]) [23], sum([24]) [24]
          from #reporte_pre
          where tipo_movimiento_id = 1
        union all
          select 2.5 orden, 'Disbursements' nombre,null [1],null [2], null [3], null [4], null [5], null [6], null [7], null [8], null [9]
          , null [10], null [11], null [12], null [13], null [14], null [15], null [16], null [17], null [18], null [19]
          , null [20], null [21], null [22], null [23], null [24]
          union all
          select 3 orden, nombre, [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24]
          from #reporte_pre
          where tipo_movimiento_id = 2
        union all
          select 4 orden, 'Total Disbursements' nombre, sum([1]) [1], sum([2]) [2], sum([3]) [3], sum([4]) [4], sum([5]) [5], sum([6]) [6], sum([7]) [7]
          , sum([8]) [8], sum([9]) [9], sum([10]) [10], sum([11]) [11], sum([12]) [12], sum([13]) [13], sum([14]) [14], sum([15]) [15]
          , sum([16]) [16], sum([17]) [17], sum([18]) [18], sum([19]) [19], sum([20]) [20], sum([21]) [21], sum([22]) [22]
          , sum([23]) [23], sum([24]) [24]
          from #reporte_pre
          where tipo_movimiento_id = 2
        union all
          select 5 orden, nombre, [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24]
          From #reporte_pre_net_cash
          where clasificacion_id = 1
        union all
          select 6 orden, nombre, [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24]
          From #reporte_pre_net_cash
          where clasificacion_id = 2
        union all
          select 7 orden,  nombre, sum([1]) [1], sum([2]) [2], sum([3]) [3], sum([4]) [4], sum([5]) [5], sum([6]) [6], sum([7]) [7]
          , sum([8]) [8], sum([9]) [9], sum([10]) [10], sum([11]) [11], sum([12]) [12], sum([13]) [13], sum([14]) [14], sum([15]) [15]
          , sum([16]) [16], sum([17]) [17], sum([18]) [18], sum([19]) [19], sum([20]) [20], sum([21]) [21], sum([22]) [22]
          , sum([23]) [23], sum([24]) [24]
          From #reporte_pre_saldos_cuentas
          group by nombre
        union all
          select 8 orden, nombre, [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24]
          From #reporte_pre_sf
          where clasificacion_id = 1
        union all
          select 9 orden, nombre, [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24]
          From #reporte_pre_sf
          where clasificacion_id = 2


          select '' espacio, nombre, [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12], [13], [14], [15], [16], [17], [18], [19], [20], [21], [22], [23], [24]
          From #reporte_final
          order by orden asc
        /* ******************************************************************* */
        /* ******************************************************************* */
        /* *********************************************************************************************************************************************************************************/

        drop table if EXISTS #data_final
        drop table if EXISTS #final_data
        drop table if EXISTS #net_cash
        drop table if EXISTS #PERIODOS
        drop table if EXISTS #reporte_pre
        drop table if EXISTS #reporte_pre_net_cash
        drop table if EXISTS #reporte_pre_saldos_cuentas
        drop table if EXISTS #final_cash_balance
        drop table if EXISTS #final_data_sf
        drop table if EXISTS #net_balance
        drop table if EXISTS #reporte_pre_sf
        drop table if EXISTS #total_cash_bank_account
        drop table if EXISTS #reporte_final

      END
    SQL
  end
end
