class TraspasosController < ApplicationController
  before_action :set_traspaso, only: %i[ show update destroy ]

  # GET /traspasos
  def index
    @traspasos = Traspaso.all

    render json: @traspasos
  end

  # GET /traspasos/1
  def show
    render json: @traspaso
  end

  # POST /traspasos
  def create
    @traspaso = Traspaso.new(traspaso_params)

    if @traspaso.save
      render json: @traspaso, status: :created, location: @traspaso
    else
      render json: @traspaso.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /traspasos/1
  def update
    if @traspaso.update(traspaso_params)
      render json: @traspaso
    else
      render json: @traspaso.errors, status: :unprocessable_entity
    end
  end

  # DELETE /traspasos/1
  def destroy
    @traspaso.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_traspaso
      @traspaso = Traspaso.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def traspaso_params
      params.require(:traspaso).permit(:fecha, :observaciones, :user_id)
    end
end
