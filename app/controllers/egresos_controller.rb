class EgresosController < ApplicationController
  before_action :set_egreso, only: %i[ show update destroy ]

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
      params.require(:egreso).permit(:categoria_id, :cuenta_id, :observaciones)
    end
end
