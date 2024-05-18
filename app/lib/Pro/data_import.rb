# frozen_string_literal: true

module Pro
  # Clase para la importacion de datos por procedimiento almacenado.
  class DataImport < ActiveRecord::Base
    # PARA LA PANTALLA DE MOVIMIENTOS
    # ejecuta el procedimiento para buscar las columnas
    # No necesita instancia_id debido a que no obtiene datos especificos.
    def self.buscar_columnas(ejercicio_fiscal, mes, is_saldos)
      execute_procedure('PA_COLUMNAS', ejercicio_fiscal, mes, 1, is_saldos)
    end

    # Ejecuta el procedimiento almacenado para buscar movimientos tanto de ingresos como egresos
    def self.buscar_movimientos(ejercicio_fiscal, mes_id, tipo_movimiento_id, is_saldos, instance_id)
      execute_procedure('PA_MOVIMIENTOS', ejercicio_fiscal, mes_id, tipo_movimiento_id, is_saldos, instance_id)
    end

    # Ejecuta el procedimiento almacenadao para buscar saldos de ingresos y egresos
    def self.buscar_saldos_ingresos_egresos(ejercicio_fiscal, mes_id, instance_id)
      execute_procedure('PA_INGRESOS_EGRESOS_SALDOS', ejercicio_fiscal, mes_id, instance_id)
    end

    # Ejecuta el prodecimiento almacenado para buscar los saldos en cuentas
    def self.buscar_saldos_cuentas(ejercicio_fiscal, mes_id, is_saldos, instance_id)
      execute_procedure('PA_SALDOS_CUENTAS', ejercicio_fiscal, mes_id, is_saldos, instance_id)
    end

    # Ejecuta el procedimiento almacenado para buscar saldos finales
    def self.pa_saldos_finales(ejercicio_fiscal, mes_id, instance_id)
      execute_procedure('PA_SALDOS_FINALES', ejercicio_fiscal, mes_id, instance_id)
    end
    # FINALIZAN PRODCEDIMIENTOS PARA EL REPORTE DE MOVIMIENTOS

    # Ejecuta el procedimiento almacenado para obtener el saldo de una tarjeta a fecha final
    # Es un proceso complejo que realiza varios calculos por los meses sin intereses.
    # Puede no llevar instancia debido a que lleva la cuenta_id
    def self.saldo_tarjeta_credito(fecha_final, cuenta_id, is_detalle)
      execute_procedure('PA_SALDO_TARJETA',  cuenta_id, fecha_final, is_detalle)
    end

    # METODOS UTILIZADOS PARA EL REPORTE EN EXCEL
    # Ejecuta el procedimiento almacenado para buscar periodos
    # Se utiliza para el reporte en excel
    def self.pa_obtener_periodos(ejercicio_fiscal, mes_id)
      execute_procedure('PA_OBTENER_PERIODOS', ejercicio_fiscal, mes_id)
    end

    # Ejecuta el procedimiento almacenado para buscar todos los movimientos
    def self.pa_reporte_movimientos(ejercicio_fiscal, mes_id, instance_id)
      execute_procedure('PA_REPORTE_MOVIMIENTOS', ejercicio_fiscal, mes_id, instance_id)
    end
  end
end
