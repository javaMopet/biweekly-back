# frozen_string_literal: true

module Resolvers
  # Obtiene el menu por niveles formando un arbol
  class MenuLevels < Resolvers::Base
    type [GraphQL::Types::JSON], null: false

    # argument :usuario_id, Integer, required: false

    # default method
    def resolve
      p current_user.id
      p current_user.name
      menu_all = Menu.all.select(
        'id, padre, nombre, ruta, icono, ' \
        'tiene_hijos, ruta_vista, null as nivel'
      )
                     .order(orden: :asc).as_json

      menu_all.filter_map do |menu|
        menu.merge(children: children(menu_all, menu, 0)) if menu['padre'].zero?
      end
    end

    # obtener hijos por cada nivel
    def children(data, line, nivel)
      line[:nivel] = nivel

      data.filter_map do |line1|
        if line['id'] == line1['padre']
          line1['nivel'] = line[:nivel] + 1
          line1['ruta'] = "#{line['ruta']}/#{line1['ruta']}"
          line1.merge(children: children(data, line1, line1['nivel']))
        end
      end
    end
  end
end
