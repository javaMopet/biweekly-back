require "test_helper"

class TransferenciasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transferencia = transferencias(:one)
  end

  test "should get index" do
    get transferencias_url, as: :json
    assert_response :success
  end

  test "should create transferencia" do
    assert_difference("Transferencia.count") do
      post transferencias_url,
           params: {
             transferencia: {
               cuenta_destino_id: @transferencia.cuenta_destino_id,
               cuenta_origen_id: @transferencia.cuenta_origen_id,
               observaciones: @transferencia.observaciones
             }
           },
           as: :json
    end

    assert_response :created
  end

  test "should show transferencia" do
    get transferencia_url(@transferencia), as: :json
    assert_response :success
  end

  test "should update transferencia" do
    patch transferencia_url(@transferencia),
          params: {
            transferencia: {
              cuenta_destino_id: @transferencia.cuenta_destino_id,
              cuenta_origen_id: @transferencia.cuenta_origen_id,
              observaciones: @transferencia.observaciones
            }
          },
          as: :json
    assert_response :success
  end

  test "should destroy transferencia" do
    assert_difference("Transferencia.count", -1) do
      delete transferencia_url(@transferencia), as: :json
    end

    assert_response :no_content
  end
end
