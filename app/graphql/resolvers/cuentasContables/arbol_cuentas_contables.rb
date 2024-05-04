# frozen_string_literal: true

module Resolvers
  module CuentasContables
    # Obtiene el menu de reportes por niveles formando un arbol
    class ArbolCuentasContables < Resolvers::Base
      type [GraphQL::Types::JSON], null: false

      # main method, metodo de entrada.
      def resolve
        reporte_root = get_reporte_permisos nil
        reportes_data = []
        if reporte_root.empty?
          { reportes_data: }
        else
          reportes_data[0] = get_data reporte_root.first

          reportes_data
        end
      end

      # obtener nodos a partir del nodo raiz.
      def get_data(reporte_root)
        {
          label: reporte_root.nombre,
          nombre: reporte_root.nombre,
          subnivel: reporte_root.subnivel,
          id: reporte_root.id,
          icon: 'data_exploration',
          selectable: false,
          children: reporte_root.hijos.map do |v|
            get_tree(v)
          end
        }
      end

      # obtener arbol a partir de nodo parametro
      def get_tree(node)
        hijos = get_reporte_permisos(node.id)
        # nodos finales
        if hijos.empty?
          return {
            label: "#{node.id} - #{node.nombre}",
            nombre: node.nombre,
            padre: {
              id: node.padre.id,
              nombre: node.padre.nombre,
              nombreCompleto: "#{node.padre.id} - #{node.padre.nombre}"
            },
            padreId: node.padre_id,
            tipoAfectacion: node.tipo_afectacion,
            subnivel: node.subnivel,
            id: node.id,
            selectable: true
          }
        end

        # nodos con hijos
        {
          label: "#{node.id} - #{node.nombre}",
          nombre: node.nombre,
          padre: {
            id: node.padre.id,
            nombre: node.padre.nombre,
            nombreCompleto: "#{node.padre.id} - #{node.padre.nombre}"
          },
          padreId: node.padre_id,
          tipoAfectacion: node.tipo_afectacion,
          subnivel: node.subnivel,
          id: node.id,
          selectable: false,
          children: hijos.map do |v|
            get_tree(v)
          end
        }
      end

      # obtiene los nodos hijos a partir del nodo padre, en teoria deberia se dependiendo de los permisos que se tengan.
      def get_reporte_permisos(padre_id)
        p "padre_id  a buscar  #{padre_id}"

        sql_where = ' '

        sql_where +=
          if padre_id.nil?
            ' padre_id is null'
          else
            " padre_id = #{padre_id}"
          end
        CuentaContable.where(sql_where).all
      end
    end
  end
end
