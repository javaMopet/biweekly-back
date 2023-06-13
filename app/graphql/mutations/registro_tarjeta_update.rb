# frozen_string_literal: true

module Mutations
  class RegistroTarjetaUpdate < BaseMutation
    description "Updates a registro_tarjeta by id"

    field :registro_tarjeta, Types::RegistroTarjetaType, null: false

    argument :id, ID, required: true
    argument :registro_tarjeta_input, Types::RegistroTarjetaInputType, required: true

    def resolve(id:, registro_tarjeta_input:)
      registro_tarjeta = ::RegistroTarjeta.find(id)
      unless registro_tarjeta.update(**registro_tarjeta_input)
        raise GraphQL::ExecutionError.new "Error updating registro_tarjeta #{registro_tarjeta.errors.full_messages}",
                                          extensions: registro_tarjeta.errors.to_hash
      end

      { registro_tarjeta: }
    end
  end
end
