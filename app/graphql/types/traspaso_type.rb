# frozen_string_literal: true

module Types
  class TraspasoType < Types::BaseObject
    field :id, ID, null: false
    field :fecha, GraphQL::Types::ISO8601Date
    field :observaciones, String
    field :user_id, ID, null: false
    field :detalle_origen, Types::TraspasoDetalleType, null: false
    # field :detalle_destino, Types::TraspasoDetalleType, null: false
    field :traspaso_detalles, [Types::TraspasoDetalleType], null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # obtener el detalle de origen
    def detalle_origen
      object.traspaso_detalles.find_by(tipo_cuenta_traspaso_id: 1)
    end

    # obtener el detalle de la cuenta destino
    # def detalle_destino
    #   object.traspaso_detalles.find_by(tipo_cuenta_traspaso_id: 2)
    # end
  end
end
