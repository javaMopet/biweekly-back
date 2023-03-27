# frozen_string_literal: true

module Resolvers  
    # Resolver para obtener la lista de cuentas contables
    class ListaCuentasContables < Resolvers::Base
      type [Types::CuentaContableType], null: false

      argument :subnivel, Integer, required: true
      argument :clasificacion, String, required: false

      def resolve(subnivel:, clasificacion:)
        sql_where = ''
        
        if(subnivel == -1)
          # CuentaContable.all          
        else
          #  CuentaContable.where({subnivel:}).all
          sql_where += " subnivel = #{subnivel}"
        end 
        if(clasificacion != '')
          sql_where += " and id like '#{clasificacion}%' "
        end 

        CuentaContable.where(sql_where).all
      end
    end  
end