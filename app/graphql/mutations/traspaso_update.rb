# frozen_string_literal: true

module Mutations
  class TraspasoUpdate < BaseMutation
    description "Updates a traspaso by id"

    field :traspaso, Types::TraspasoType, null: false

    argument :id, ID, required: true
    argument :traspaso_input, Types::TraspasoInputType, required: true
    argument :traspasos_detalle_input, [Types::TraspasoDetalleInputType], required: true

    # default method
    def resolve(id:, traspaso_input:, traspasos_detalle_input:)
      traspaso = ::Traspaso.find(id)

      p traspaso
      p traspaso_input
      # p traspasos_detalle_input
      actualizar_detalles traspasos_detalle_input
      # unless traspaso.update(**traspaso_input)
      #   raise GraphQL::ExecutionError.new "Error updating traspaso", extensions: traspaso.errors.to_hash
      # end

      { traspaso: }
    end

    # Se actualizan los detalles del traspaso
    def actualizar_detalles(traspasos_detalle_input)
      traspasos_detalle_input.each do |detalle_param|
        p detalle_param
      end 
    end
  end
end
