# frozen_string_literal: true

module Mutations
  class BancoUpdate < BaseMutation
    description "Updates a banco by id"

    field :banco, Types::BancoType, null: false

    argument :id, ID, required: true
    argument :banco_input, Types::BancoInputType, required: true

    def resolve(id:, banco_input:)
      banco = ::Banco.find(id)
      raise GraphQL::ExecutionError.new "Error updating banco", extensions: banco.errors.to_hash unless banco.update(**banco_input)

      { banco: banco }
    end
  end
end
