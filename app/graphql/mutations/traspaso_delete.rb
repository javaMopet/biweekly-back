# frozen_string_literal: true

module Mutations
  class TraspasoDelete < BaseMutation
    description "Deletes a traspaso by ID"

    field :traspaso, Types::TraspasoType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      traspaso = ::Traspaso.find(id)
      raise GraphQL::ExecutionError.new "Error deleting traspaso", extensions: traspaso.errors.to_hash unless traspaso.destroy

      { traspaso: traspaso }
    end
  end
end
