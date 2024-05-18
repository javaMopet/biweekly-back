# frozen_string_literal: true

# Controlador para registros
class RegistrosController < ApplicationController
  include UpdateAccountBalance
  before_action :authenticate_user_from_token!
  # before_action :set_registro, only: %i[show update destroy]

  # GET /to_excel
  def excel_example
    Axlsx::Package.new do |obj|
      obj.workbook.add_worksheet(name: "Sheet Name") do |sheet|
        sheet.add_row ["Simple Pie Chart"]
        %w[first second third].each { |label| sheet.add_row [label, rand(1..24)] }
        sheet.add_chart(
          Axlsx::Pie3DChart,
          start_at: [0,5],
          end_at: [10, 20],
          title: "example 3: Pie Chart"
        ) do |chart|
          chart.add_series data: sheet["B2:B4"], labels: sheet["A2:A4"], colors: ['FF0000', '00FF00', '0000FF']
        end
      end
      send_data obj.to_stream.read, type: "application/xlsx", filename: 'filename.xlsx'
    end
  end

  # # POST /registros
  # def create
  #   ActiveRecord::Base.transaction do
  #     @registro = Registro.new(registro_params)

  #     if @registro.save
  #       update_account_balance registro.cuenta.id
  #       render json: @registro, status: :created, location: @registro
  #     else
  #       render json: @registro.errors, status: :unprocessable_entity
  #     end
  #   rescue StandardError => e
  #     puts e
  #     raise e
  #   end
  # end

  # # PATCH/PUT /registros/1
  # def update
  #   ActiveRecord::Base.transaction do
  #     if @registro.update(registro_params)
  #       update_account_balance registro.cuenta.id
  #       render json: @registro
  #     else
  #       render json: @registro.errors, status: :unprocessable_entity
  #     end
  #   rescue StandardError => e
  #     puts e
  #     raise e
  #   end
  # end

  # # DELETE /registros/1
  # def destroy
  #   @registro.destroy
  # end

  # private

  # # Use callbacks to share common setup or constraints between actions.
  # def set_registro
  #   @registro = Registro.find(params[:id])
  # end

  # # Only allow a list of trusted parameters through.
  # def registro_params
  #   params.require(:registro).permit(:estado_registro_id, :registrable_type, :registrable_id, :importe, :fecha)
  # end
end
