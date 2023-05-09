# frozen_string_literal: true

module Pro
  # Clase para la importacion de datos por procedimiento almacenado.
  class DataImport < ActiveRecord::Base
    def self.buscar_columnas(ejercicio_fiscal)
      p " Buscando columnas con ejercicio_fiscal: #{ejercicio_fiscal}"
      execute_procedure('PA_COLUMNAS', 2023, 4, 1, 2)
    end

    def self.buscar_movimientos(_ejercicio_fiscal, tipo_movimiento_id, is_saldos)
      execute_procedure('PA_MOVIMIENTOS', 2023, 4, 1, tipo_movimiento_id, is_saldos)
    end

    def self.buscar_saldos_movimientos(_ejercicio_fiscal, _mes, _quincena)
      execute_procedure('PA_INGRESOS_EGRESOS_SALDOS', 2023, 4, 1)
    end

    def self.buscar_saldos_cuentas(_ejercicio_fiscal, is_saldos)
      execute_procedure('PA_SALDOS_CUENTAS', 2023, 4, 1, 1, is_saldos)
    end

    def self.buscar_saldos_finales(_ejercicio_fiscal)
      execute_procedure('PA_SALDOS_FINALES', 2023, 4, 1)
    end
  end
end
