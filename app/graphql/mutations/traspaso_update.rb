# frozen_string_literal: true

module Mutations
  class TraspasoUpdate < BaseMutation
    description "Updates a traspaso by id"

    field :traspaso, Types::TraspasoType, null: false

    argument :id, ID, required: true
    argument :traspaso_input, Types::TraspasoInputType, required: true

    def resolve(id:, traspaso_input:)
      traspaso = ::Traspaso.find(id)
      raise GraphQL::ExecutionError.new "Error updating traspaso", extensions: traspaso.errors.to_hash unless traspaso.update(**traspaso_input)

      { traspaso: traspaso }
    end
  end
end
