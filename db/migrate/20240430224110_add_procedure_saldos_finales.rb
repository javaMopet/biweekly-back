class AddProcedureSaldosFinales < ActiveRecord::Migration[7.0]
  # crear procedimiento almacenado saldos finales
  def up
    execute <<~SQL
        CREATE PROCEDURE [dbo].[PA_SALDOS_FINALES]
        (
          @ejercicio_fiscal int= 2023,
          @mes int =4,
          @instance_id int
        )
      AS
      BEGIN
      -- EN ESTE PROCEDIMIENTO SE OBTIENEN DOS LINEA EL NET CASH POR PERIODO Y EL FINAL CASH BALANCE POR PERIODO

        SET NOCOUNT ON;

      create table #PERIODOS(id int, mes_id int, mes_nombre varchar(11), numero_quincena int, quincena_id int, fecha_inicio date
        , fecha_fin date, nombre varchar(200))

      insert into #PERIODOS
      exec PA_OBTENER_PERIODOS @ejercicio_fiscal = @ejercicio_fiscal, @mes = @mes

      create table #final_cash_balance(periodo_id int, importe money)
      create table #total_cash_bank_account(clasificacion_id bigint, periodo_id int, importe money)
      create table #net_balance(clasificacion_id bigint, periodo_id int, importe money)
      create table #final_data(clasificacion_id bigint, periodo_id int, importe money)

      insert into #final_cash_balance(periodo_id, importe)
        select  periodos.id periodo_id, sum(registros.importe) importe
        from registros
        join cuentas on registros.cuenta_id = cuentas.id
          left join #PERIODOS periodos on registros.fecha <= periodos.fecha_fin
        where cuentas.instance_id = @instance_id
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
        )z group by clasificacion, periodo_id


      insert into #final_data
        (clasificacion_id, periodo_id, importe)
      select clasificacion_id, periodo_id, importe
      from (
            select *
          from #total_cash_bank_account
        union all
          select clasificacion_id, periodo_id, importe
          from #net_balance
        )data


        SELECT clasificacion_id, [0], [1], [2], [3], [4], [5], [6], [7],[8], [9], [10], [11], [12], [13], [14], [15],[16], [17], [18], [19], [20], [21], [22], [23],[24]
          into #reporte_pre
        FROM
        (   select * from #final_data ) AS SourceTable
        PIVOT
        (
          sum(importe)
          FOR periodo_id IN ([0], [1], [2], [3], [4], [5], [6], [7],[8], [9], [10], [11], [12], [13], [14], [15],[16], [17], [18], [19], [20], [21], [22], [23],[24])
        ) AS PivotTable;

      select ''icono,case clasificacion_id when 1 then 'Total Cash bank account' when 2 then 'Net balance' ELSE '' end  nombre_categoria
        , clasificacion_id categoria_id
        , [0], [1], [2], [3], [4], [5], [6], [7],[8], [9], [10], [11], [12], [13], [14], [15],[16], [17], [18], [19], [20], [21], [22], [23],[24]
      from #reporte_pre
      order by clasificacion_id asc

      drop table #PERIODOS
      drop table #reporte_pre
      drop table #final_cash_balance
      drop table #net_balance
      drop table #total_cash_bank_account
      drop table #final_data

       end
    SQL
  end
end
