# frozen_string_literal: true

module Mutations
  class RegistroTarjetaDelete < BaseMutation
    description "Deletes a registro_tarjeta by ID"

    field :registro_tarjeta, Types::RegistroTarjetaType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      registro_tarjeta = ::RegistroTarjeta.find(id)
      raise GraphQL::ExecutionError.new "Error deleting registro_tarjeta", extensions: registro_tarjeta.errors.to_hash unless registro_tarjeta.destroy

      { registro_tarjeta: }
    end
  end
end
