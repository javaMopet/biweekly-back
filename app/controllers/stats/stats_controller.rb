# frozen_string_literal: true

module Stats
  class StatsController < ApplicationController
    before_action :authenticate_user_from_token!
    before_action :set_instance
    # Obtener el dataset para la grafica de ingresos y egresos.
    def ingresos_egresos_dataset
      # year = 2024
      p @year
      retorno =
        Registro.joins(:cuenta, :categoria)
                .where(cuentas: { instance_id: @instance_id })
                .where('YEAR(registros.fecha) = ?', @year)
                .select('MONTH(registros.fecha) AS mes, categorias.tipo_movimiento_id, ' \
                        'SUM(case categorias.tipo_movimiento_id when 1 then registros.importe ' \
                        'when 2 then registros.importe * -1 end) AS importe')
                .group('MONTH(registros.fecha), categorias.tipo_movimiento_id')
                .order('categorias.tipo_movimiento_id, MONTH(registros.fecha)')
                .map do |registro|
          {
            mes: registro.mes,
            tipo_movimiento_id: registro.tipo_movimiento_id,
            importe: registro.importe
          }
        end

      render json: { data: retorno.as_json }, status: :ok
    end

    # Obtener el dataset para la grafica de ingresos.
    def ingresos_dataset
      p @instance_id
      # year = 2024
      retorno = obtener_registros(1,  @year)
      render json: { retorno: }, status: :ok
    end

    # Obtener el dataset para la grafica de egresos.
    def egresos_dataset
      # year = 2024
      retorno = obtener_registros(2, @year)
      render json: { retorno: }, status: :ok
    end

    private

    def obtener_registros(tipo_movimiento_id, year)
      # p @instance_id
      Registro.joins(:cuenta, :categoria)
              .where(cuentas: { instance_id: @instance_id })
              .where('YEAR(registros.fecha) = ?', year)
              .where('categorias.tipo_movimiento_id = ?', tipo_movimiento_id)
              .select('categorias.tipo_movimiento_id, categorias.nombre,  ' \
                      'sum(case categorias.tipo_movimiento_id ' \
                      'when 1 then importe else importe *-1 end ) importe, ' \
                      'categorias.color')
              .group('categorias.nombre, categorias.tipo_movimiento_id, categorias.color')
              .order('tipo_movimiento_id, nombre')
              .map do |registro|
        {
          tipo_movimiento_id: registro.tipo_movimiento_id,
          categoria: registro.nombre,
          importe: registro.importe,
          color: registro.color
        }
      end
    end

    def set_instance
      @year = params[:year]
      @instance_id = params[:instanceId]
    end
  end
end
