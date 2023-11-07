# frozen_string_literal: true

module Resolvers
  # Resolver para obtener la lista de cuentas contables
  class ListaCuentasContables < Resolvers::Base
    type [Types::CuentaContableType], null: false

    argument :subnivel, Integer, required: false
    argument :clasificacion, String, required: false
    argument :tipo_afectacion, String, required: false # , default: 'C'

    # Default method
    def resolve(subnivel:, clasificacion:, tipo_afectacion:)
      sql_where = ''

      sql_where += " subnivel = #{subnivel}" unless subnivel.nil?
      sql_where += ' and ' unless sql_where == ''
      sql_where += " tipo_afectacion = '#{tipo_afectacion}'" unless tipo_afectacion.nil?
      sql_where += ' and ' unless sql_where == ''
      sql_where += " id like '#{clasificacion}%' " if clasificacion != ''

      CuentaContable.where(sql_where).all
    end
  end
end
