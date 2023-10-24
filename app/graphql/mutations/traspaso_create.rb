# frozen_string_literal: true

module Mutations
  class TraspasoCreate < BaseMutation
    description "Creates a new traspaso"

    field :traspaso, Types::TraspasoType, null: false

    argument :traspaso_input, Types::TraspasoInputType, required: true
    argument :traspasos_detalle_input, [Types::TraspasoInputType], required: true

    def resolve(traspaso_input:, traspasos_detalle_input:)
      ApplicationRecord.transaction do 

        traspaso = ::Traspaso.new(**traspaso_input)

        traspasos_detalle_input.each do |td|
          detalle = ::TraspasoDetalle.new(**td)
          detalle.traspaso = traspaso 
          traspaso.traspasos_detalle.push(detalle)
        end 

        raise GraphQL::ExecutionError.new "Error creating traspaso", extensions: traspaso.errors.to_hash unless traspaso.save

        { traspaso: traspaso }
      end 
    rescue ActiveRecord::RecordInvalid => e
      puts e.record.errors.to_json
      { error: 'Error al crear el traspaso.', exception: e }    
    end
  end
end
