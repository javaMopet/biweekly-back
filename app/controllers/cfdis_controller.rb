class CfdisController < ApplicationController
  before_action :set_cfdi, only: %i[ show update destroy ]

  # GET /cfdis
  def index
    @cfdis = Cfdi.all

    render json: @cfdis
  end

  # GET /cfdis/1
  def show
    render json: @cfdi
  end

  # POST /cfdis
  def create
    @cfdi = Cfdi.new(cfdi_params)

    if @cfdi.save
      render json: @cfdi, status: :created, location: @cfdi
    else
      render json: @cfdi.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cfdis/1
  def update
    if @cfdi.update(cfdi_params)
      render json: @cfdi
    else
      render json: @cfdi.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cfdis/1
  def destroy
    @cfdi.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cfdi
      @cfdi = Cfdi.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cfdi_params
      params.require(:cfdi).permit(:uuid, :rfc_emisor, :rfc_receptor)
    end
end
