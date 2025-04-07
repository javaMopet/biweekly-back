# frozen_string_literal: true

module Mutations
  class Register < GraphqlDevise::Mutations::Register
    argument :name, String, required: true
    argument :instances, [ID], required: false
    argument :roles, [ID], required: false

    field :authenticatable, Types::UserType, null: true
    # , instances:, roles:
    # main method
    def resolve(email:, name:, instances: [], roles: [], **attrs)
      # Eliminar manualmente :instances del hash para que no lo intente usar GraphqlDevise
      attrs_without_instances = attrs.except(:instances, :roles)

      # authorize!(:save, user)

      # Registrar usuario sin intentar asignar las instancias aun
      original_payload = super(**attrs_without_instances.merge(email: email, name: name))

      user = original_payload[:authenticatable]

      if instances.present?
        # Buscar las instancias como objetos ActiveRecord
        instance_records = Instance.where(id: instances)
        user.instances = instance_records
      end

      if roles.present?
        # Buscar los roles como objetos ActiveRecord
        role_records = Role.where(id: roles).map(&:name)
        role_records.each do |role_name|
          user.add_role role_name.to_sym
        end
      end

      original_payload.merge(user: user)
    end
  end
end
