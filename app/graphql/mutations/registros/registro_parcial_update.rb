# frozen_string_literal: true

module Mutations
  module Registros
    class RegistroParcialUpdate < BaseMutation
      include UpdateAccountBalance
      description "Update ciertos datos de un registro"

      field :registro, Types::RegistroType, null: false

      argument :id, ID, required: true
      argument :observaciones, String, required: true

      # main resolver
      def resolve(id:, observaciones:)
        ActiveRecord::Base.transaction do
          registro = ::Registro.find(id)

          authorize!(:update, registro)

          registro.observaciones = observaciones

          unless registro.update(observaciones:)
            raise GraphQL::ExecutionError.new "Error updating registro observaciones",
                                              extensions: registro.errors.to_hash
          end

          { registro: }
        rescue StandardError => e
          puts e
          raise e
        end
      end
    end
  end
end
