# require_relative '../models/ar/template_builder_logic'

class TiposCuentaController < ApplicationController
  include ExcelBuilderHelper
  # before_action :set_tipo_cuenta, only: %i[ show update destroy ]

  def create_xls_template
    users = User.all
    send_data(build_xls_template(users).read, type: 'application/vnd.ms-excel', disposition: 'attachment',filename: 'prueba100.xlsx')
  end
end
