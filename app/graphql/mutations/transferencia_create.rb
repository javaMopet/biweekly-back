# frozen_string_literal: true

module Mutations
  # Creación de un movimiento de transferencia
  class TransferenciaCreate < BaseMutation
    description 'Creates a new transferencia'

    field :transferencia, Types::TransferenciaType, null: false

    argument :transferencia_input, Types::TransferenciaInputType, required: true

    def resolve(transferencia_input:)
      registro = ::Registro.new(**transferencia_input[:registro])
      transferencia = ::Transferencia.new(transferencia_input.to_hash.except!(:registro))

      registro.registrable = transferencia
      unless transferencia.save
        raise GraphQL::ExecutionError.new "Error creating transferencia #{registro.errors.full_messages}",
                                          extensions: transferencia.errors.to_hash
      end

      { transferencia: }
    end
  end
end
