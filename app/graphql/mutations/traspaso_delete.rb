# frozen_string_literal: true

module Mutations
  class TraspasoDelete < BaseMutation
    description "Deletes a traspaso by ID"

    field :traspaso, Types::TraspasoType, null: false

    argument :id, ID, required: true

    # default method
    def resolve(id:)
      traspaso = ::Traspaso.find(id)

      authorize!(:destroy, traspaso)

      traspaso.traspaso_detalles.destroy_all

      unless traspaso.destroy
        raise GraphQL::ExecutionError.new "Error deleting traspaso", extensions: traspaso.errors.to_hash
      end

      { traspaso: }
    end
  end
end
