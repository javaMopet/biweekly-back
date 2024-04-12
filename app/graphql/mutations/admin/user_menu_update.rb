# frozen_string_literal: true

module Mutations
  module Admin
    class UserMenuUpdate < BaseMutation
      description "Updates the menu from a user by id"

      field :user, Types::UserType, null: false

      argument :id, ID, required: true
      argument :menu_input, GraphQL::Types::JSON, required: true

      # main resolver
      def resolve(id:, menu_input:)
        user = ::User.find(id)

        p user.name
        menu_input.each do |mi|
          p mi

          p mi["menuId"]

          p mi["checked"]

          if mi["checked"]
            p "cambiando a true"
            user.add_role :menuRole, Menu.find(mi["menuId"])
          else
            p "cambiando a false"
            user.remove_role :menuRole, Menu.find(mi["menuId"])
          end
        end
        { user: }
      end
    end
  end
end
