class AddProcedureObtenerPeriodos < ActiveRecord::Migration[7.0]
  # crear procedimiento almacenado obtener periodos
  def up
    execute <<~SQL
        CREATE PROCEDURE [dbo].[PA_OBTENER_PERIODOS]
      	(
          @ejercicio_fiscal int= 2023,
      		@mes int =4)
      AS
      BEGIN
      	SET NOCOUNT ON;


      --DROP TABLE #TMP
      select 1 id_mes, CAST('ENERO' AS VARCHAR(12)) nombre_mes into #TMP

      insert into #TMP values (2,'FEBRERO')
      insert into #TMP values (3,'MARZO')
      insert into #TMP values (4,'ABRIL')
      insert into #TMP values (5,'MAYO')
      insert into #TMP values (6,'JUNIO')
      insert into #TMP values (7,'JULIO')
      insert into #TMP values (8,'AGOSTO')
      insert into #TMP values (9,'SEPTIEMBRE')
      insert into #TMP values (10,'OCTUBRE')
      insert into #TMP values (11,'NOVIEMBRE')
      insert into #TMP values (12,'DICIEMBRE')

      -- DROP TABLE #DATA
        select *, DATEFROMPARTS(@ejercicio_fiscal,id_mes,15) FECHA_INICIO, 2 QUINCENA
        INTO #DATA
        from #TMP
      UNION ALL
        select *, DATEFROMPARTS(@ejercicio_fiscal,id_mes,1) FECHA_INICIO, 1 QUINCENA
        from #TMP

      SELECT *, CASE when QUINCENA = 1 THEN DATEFROMPARTS(@ejercicio_fiscal,id_mes, 14) ELSE EOMONTH(FECHA_INICIO) END FECHA_FIN
          , case when QUINCENA = 1 then DATEADD(day, 0, FECHA_INICIO) else FECHA_INICIO END F_INI
      INTO #DATA2
      FROM #DATA
      ORDER BY id_mes ASC, QUINCENA ASC

      --  drop table #TMP3
      SELECT ROW_NUMBER() OVER(ORDER BY id_mes asc, QUINCENA asc ) id, id_mes, QUINCENA, nombre_mes,((id_mes-1)*2)+quincena numero_quincena,  F_INI
      , case when QUINCENA = 2 then DATEADD(day, 0, FECHA_FIN) else FECHA_FIN END F_FIN
      INTO #TMP3
      FROM #DATA2

      -- drop table #PERIODOS
      SELECT id, id_mes mes_id, nombre_mes mes_nombre, QUINCENA numero_quincena, numero_quincena quincena_id, F_INI fecha_inicio, F_FIN fecha_fin
        , 'del '+ rtrim(DAY(F_INI))+' al '+rtrim(day(F_FIN)) +' de '+nombre_mes nombre
      into #PERIODOS
      FROM #TMP3
      -- where id_mes = 4
      ORDER BY numero_quincena asc

      select * from #PERIODOS

      drop table if exists #DATA
      drop table if exists #DATA2
      drop table if exists #PERIODOS
      drop table if exists #TMP
      drop table if exists #TMP3

        end
    SQL
  end
end
