# frozen_string_literal: true

module Resolvers
  module CuentasContables
    # Obtiene el menú de reportes por niveles formando un árbol
    class ArbolCuentasContables < Resolvers::Base
      type [GraphQL::Types::JSON], null: false      

      def resolve()
        reporte_root = get_reporte_permisos nil
        reportes_data = []        
        if reporte_root.empty?
          { reportes_data: }
        else
          reportes_data[0] = get_data reporte_root[0]

          reportes_data
        end
      end

      def get_data(reporte_root)
        { label: reporte_root.nombre,
          subnivel: reporte_root.subnivel,
          id: reporte_root.id,
          icon: 'data_exploration',
          selectable: false,
          children: reporte_root.hijos.collect do |v|
                      get_tree(v)
                    end 
        }
      end

      def get_tree(node)        
        hijos = get_reporte_permisos( node.id)
        # nodos finales        
        if hijos.empty?
          return { label: "#{node.id.to_s} - #{node.nombre}",
                   subnivel: node.subnivel, id: node.id, selectable: true }
        end

        # nodos con hijos
        { label: "#{node.id.to_s} - #{node.nombre}", subnivel: node.subnivel, id: node.id, selectable: false,
          children: hijos.collect do |v|
                      get_tree(v)
                    end }
      end

      def get_reporte_permisos( padre_id)        
        p "padre_id  a buscar  #{padre_id}"
                
        sql_where = " "

         if !padre_id.nil?          
          sql_where += " padre_id = #{padre_id}"
         else
          sql_where += " padre_id is null"
         end         
        CuentaContable.where(sql_where).all
      end
    end
  end
end
