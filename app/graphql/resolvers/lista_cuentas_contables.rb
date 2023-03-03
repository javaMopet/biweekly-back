# frozen_string_literal: true

module Resolvers  
    # Resolver para obtener la lista de cuentas contables
    class ListaCuentasContables < Resolvers::Base
      type [Types::CuentaContableType], null: false

      argument :subnivel, Integer, required: false

      def resolve(subnivel:)
        if(subnivel.nil?)
          CuentaContable.all
        else
          CuentaContable.where({subnivel:}).all
        end 
      end
    end  
end