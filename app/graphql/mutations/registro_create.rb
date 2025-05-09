# frozen_string_literal: true

module Mutations
  class RegistroCreate < BaseMutation
    include UpdateAccountBalance
    description "Creates a new registro"

    field :registro, Types::RegistroType, null: false

    argument :registro_input, Types::RegistroInputType, required: true

    # Resolver
    def resolve(registro_input:)
      ActiveRecord::Base.transaction do
        registro = ::Registro.new(**registro_input)
        registro.user_id = current_user.id

        authorize!(:save, registro)

        unless registro.save
          raise GraphQL::ExecutionError.new "Error creating registro", extensions: registro.errors.to_hash
        end

        update_account_balance registro.cuenta.id

        { registro: }
      rescue StandardError => e
        puts e
        raise e
      end
    end
  end
end
