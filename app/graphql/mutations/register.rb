# frozen_string_literal: true

module Mutations
  class Register < GraphqlDevise::Mutations::Register
    argument :name, String, required: true
    argument :instance_id, ID, required: true

    field :user, Types::UserType, null: true

    # main method
    def resolve(email:, name:, instance_id:, **attrs)
      original_payload = super
      original_payload.merge(user: original_payload[:authenticatable])
    end
  end
end
