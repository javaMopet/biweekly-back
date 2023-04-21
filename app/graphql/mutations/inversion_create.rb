# frozen_string_literal: true

module Mutations
  # Creación de un movimiento de Inversion
  class InversionCreate < BaseMutation
    description 'Creates a new inversion'

    field :inversion, Types::InversionType, null: false

    argument :inversion_input, Types::InversionInputType, required: true

    def resolve(inversion_input:)
      registro = ::Registro.new(**ingreso_input[:registro])
      inversion = ::Inversion.new(inversion_input.to_hash.except!(:registro))

      registro.registrable = inversion
      unless registro.save
        raise GraphQL::ExecutionError
          .new "Error creating inversion #{registro.errors.full_messages}",
               extensions: inversion.errors.to_hash
      end

      { inversion: }
    end
  end
end
