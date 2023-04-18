# frozen_string_literal: true

module Mutations
  # Creación de un registro de Egreso.
  class EgresoCreate < BaseMutation
    description 'Creates a new egreso'

    field :egreso, Types::EgresoType, null: false

    argument :egreso_input, Types::EgresoInputType, required: true

    def resolve(egreso_input:)
      registro = ::Registro.new(**egreso_input[:registro])
      egreso = ::Egreso.new(egreso_input.to_hash.except!(:registro))

      registro.registrable = egreso
      unless registro.save
        raise GraphQL::ExecutionError.new "Error creating egreso #{registro.erros.full_messages}",
                                          extensions: egreso.errors.to_hash
      end

      { egreso: }
    end
  end
end
