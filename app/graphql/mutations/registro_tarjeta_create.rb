# frozen_string_literal: true

module Mutations
  class RegistroTarjetaCreate < BaseMutation
    description "Creates a new registro_tarjeta"

    field :registro_tarjeta, Types::RegistroTarjetaType, null: false

    argument :registro_tarjeta_input, Types::RegistroTarjetaInputType, required: true

    def resolve(registro_tarjeta_input:)
      registro_tarjeta = ::RegistroTarjeta.new(**registro_tarjeta_input)
      raise GraphQL::ExecutionError.new "Error creating registro_tarjeta", extensions: registro_tarjeta.errors.to_hash unless registro_tarjeta.save

      { registro_tarjeta: }
    end
  end
end
