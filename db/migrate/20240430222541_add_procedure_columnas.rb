class AddProcedureColumnas < ActiveRecord::Migration[7.0]
  # crear procedimiento almacenado generar columnas
  def up
    execute <<~SQL
        CREATE PROCEDURE [dbo].[PA_COLUMNAS]
        (
          @ejercicio_fiscal int= null,
          @mes int =null,
          @quincena int = null,
          @isSaldos bit = 0
        )
      AS
      BEGIN

        SET NOCOUNT ON;

      create table #PERIODOS(id int, mes_id int, mes_nombre varchar(11), numero_quincena int, quincena_id int, fecha_inicio date, fecha_fin date, nombre varchar(200))

      insert into #PERIODOS
      exec PA_OBTENER_PERIODOS @ejercicio_fiscal = @ejercicio_fiscal, @mes = @mes

      declare @quincena_inicial int = 0
      declare @quincena_final int = 0

      select @quincena_inicial = (@mes*2)+(@quincena-1)-2
      select @quincena_final = (@mes*2)+(@quincena-1)+3

      -- select 'icono' name,'' label,'icono' field,'false' sortable,'center' align, 'background-color: #f6f8fa;' style, '' classes
      -- union all
      select 0 periodo_id, '' fecha_inicio, ''fecha_fin,'nombre_categoria' name,'Categoria Ingreso-Egreso' label,'nombre_categoria' field,'true' sortable,'left' align, 'width:16%' style, '' classes
      UNION ALL
      select periodos.id periodo_id, periodos.fecha_inicio, periodos.fecha_fin, 'columna_'+rtrim(quincena_id) name,periodos.nombre label,rtrim(QUINCENA_ID) field,'true' sortable,'right' align
      ,'width: 14%'+case @isSaldos when 0 then ';background-color: #f6f8fa' else '' end  style,case @isSaldos when 0 then 'tabla-columna-importe' else 'tabla-columna__saldo' end  classes
      from #PERIODOS periodos
       where quincena_id BETWEEN @quincena_inicial and @quincena_final

      drop table #PERIODOS


      end
    SQL
  end
end
