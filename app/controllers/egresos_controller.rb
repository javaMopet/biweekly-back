class EgresosController < ApplicationController
  before_action :set_egreso, only: %i[show update destroy]

  # GET /egresos
  def index
    @egresos = Egreso.all

    render json: @egresos
  end

  # GET /egresos/1
  def show
    render json: @egreso
  end

  # POST /egresos
  def create
    @egreso = Egreso.new(egreso_params)

    if @egreso.save
      render json: @egreso, status: :created, location: @egreso
    else
      render json: @egreso.errors, status: :unprocessable_entity
    end
  end

  
  # def create_list
  #   listado = params.fetch(:lista_egresos, [])
  #   # p listado.class
  #   # p listado
  #   # listado = params["lista_egresos"]
  #   # listado_json =  JSON.parse(listado.to_json)
  #   # p listado_json.class
  #   # p listado_json
  #   # p (listado_json.to_a)[0]["registro"]
  #   listado.each do |egreso|
  #     p egreso["registro"]
  #     p egreso[:registro]
  #     p egreso[:categoria_id]
  #     p egreso[:cuenta_id]
  #     p egreso[:registro][:estado_registro_id]
  #     registro = obtener_registro egreso[:registro]
  #     egreso_save = obtener_egreso egreso

  #     registro.registrable = egreso_save
  #     egreso_save.registro = registro

  #     p egreso_save.errors.full_messages unless egreso_save.save
  #   end
  # end

  # PATCH/PUT /egresos/1
  def update
    if @egreso.update(egreso_params)
      render json: @egreso
    else
      render json: @egreso.errors, status: :unprocessable_entity
    end
  end

  # DELETE /egresos/1
  def destroy
    @egreso.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_egreso
    @egreso = Egreso.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def egreso_params
    params.require(:egreso).permit(:categoria_id, :cuenta_id, :observaciones, registro: [:estado_registro_id, :importe, :fecha, :observaiones])
  end

  def obtener_registro(registro_aux)
    registro = Registro.new

    registro.estado_registro_id = registro_aux[:estado_registro_id]
    registro.importe = registro_aux[:importe]
    registro.fecha = registro_aux[:fecha]
    registro.cuenta_id = registro_aux[:cuenta_id]
    registro.observaciones = registro_aux[:observaciones]

    registro
  end

  def obtener_egreso(egreso_aux)
    egreso =Egreso.new
    egreso.categoria_id = egreso_aux[:categoria_id]
    egreso
  end
end
