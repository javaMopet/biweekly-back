# frozen_string_literal: true

module Mutations
  class BancoCreate < BaseMutation
    description "Creates a new banco"

    field :banco, Types::BancoType, null: false

    argument :banco_input, Types::BancoInputType, required: true

    # Default method
    def resolve(banco_input:)
      banco = ::Banco.new(**banco_input)
      banco.user_id = current_user.id

      unless can? :save, banco
        raise GraphQL::ExecutionError.new "error: unauthorized access: create 'banco'",
                                          extensions: { code: :unauthorized }
      end

      raise GraphQL::ExecutionError.new "Error creating banco", extensions: banco.errors.to_hash unless banco.save

      { banco: }
    end
  end
end
