# frozen_string_literal: true

module Mutations
  class RegistroTarjetaDateUpdate < BaseMutation
    include UpdateAccountBalanceCredit
    description "Actualiza la fecha de los registros que se originan de un registro de tarjeta"

    # field :registro_tarjeta, Types::RegistroTarjetaType, null: false
    field :fecha_nueva, GraphQL::Types::ISO8601Date, null: true

    argument :pago_tarjeta_id, ID, required: true
    argument :fecha, GraphQL::Types::ISO8601Date, required: true

    # Main resolver
    def resolve(pago_tarjeta_id:, fecha:)
      ActiveRecord::Base.transaction do
        Registro.joins(:registro_tarjeta).where(registro_tarjeta: { pago_tarjeta_id: }).update_all(fecha:)

        { fecha_nueva: fecha }
      rescue StandardError => e
        puts e
        raise GraphQL::ExecutionError, "Se produjo un error al intentar actualizar la fecha."
      end
    end
  end
end
