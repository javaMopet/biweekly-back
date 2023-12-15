# frozen_string_literal: true

module Types
  # Graphql type para Registro
  class RegistroType < Types::BaseObject
    field :id, ID, null: false
    field :estado_registro_id, Integer, null: false
    field :tipo_afectacion, String, null: false
    field :importe, Float
    field :fecha, GraphQL::Types::ISO8601Date
    field :observaciones, String
    field :nombre_completo, String
    field :cuenta_id, Integer, null: false
    field :cargo, Float, null: true
    field :abono, Float, null: true
    field :disable, Boolean, null: false
    field :registro_tarjeta, Types::RegistroTarjetaType, null: true
    field :traspaso_detalle, Types::TraspasoDetalleType, null: true
    field :categoria, Types::Categorias::CategoriaType, null: true
    field :user_id, ID, null: false
    field :cuenta, Types::Cuentas::CuentaType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # bandera que determina si el registro puede tener algun cambio
    def disable
      !object.registro_tarjeta.nil?
    end
  end
end
