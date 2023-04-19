# frozen_string_literal: true

module Pro
  # Clase para la importacion de datos por procedimiento almacenado.
  class DataImport < ActiveRecord::Base
    def self.buscar_columnas(ejercicio_fiscal)
      p " Buscando columnas con ejercicio_fiscal: #{ejercicio_fiscal}"
      execute_procedure('PA_COLUMNAS', 2023, 4, 1, 2)
    end

    def self.buscar_movimientos(ejercicio_fiscal)
      p " Buscando movimientos ejercicio_fiscal: #{ejercicio_fiscal}"
      execute_procedure('PA_MOVIMIENTOS', 2023, 4, 1, 2)
    end
  end
end
