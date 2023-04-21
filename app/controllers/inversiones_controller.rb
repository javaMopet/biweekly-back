class InversionesController < ApplicationController
  before_action :set_inversion, only: %i[ show update destroy ]

  # GET /inversiones
  def index
    @inversiones = Inversion.all

    render json: @inversiones
  end

  # GET /inversiones/1
  def show
    render json: @inversion
  end

  # POST /inversiones
  def create
    @inversion = Inversion.new(inversion_params)

    if @inversion.save
      render json: @inversion, status: :created, location: @inversion
    else
      render json: @inversion.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /inversiones/1
  def update
    if @inversion.update(inversion_params)
      render json: @inversion
    else
      render json: @inversion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /inversiones/1
  def destroy
    @inversion.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inversion
      @inversion = Inversion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inversion_params
      params.require(:inversion).permit(:categoria_id, :cuenta_id, :observaciones)
    end
end
