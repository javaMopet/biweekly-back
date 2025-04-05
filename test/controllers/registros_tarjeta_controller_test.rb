require "test_helper"

class RegistrosTarjetaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registro_tarjeta = registros_tarjeta(:one)
  end

  test "should get index" do
    get registros_tarjeta_url, as: :json
    assert_response :success
  end

  test "should create registro_tarjeta" do
    assert_difference("RegistroTarjeta.count") do
      post registros_tarjeta_url,
           params: {
             registro_tarjeta: {
               concepto: @registro_tarjeta.concepto,
               cuenta_id: @registro_tarjeta.cuenta_id,
               estado_registro_tarjeta_id: @registro_tarjeta.estado_registro_tarjeta_id,
               fecha: @registro_tarjeta.fecha,
               importe: @registro_tarjeta.importe
             }
           },
           as: :json
    end

    assert_response :created
  end

  test "should show registro_tarjeta" do
    get registro_tarjeta_url(@registro_tarjeta), as: :json
    assert_response :success
  end

  test "should update registro_tarjeta" do
    patch registro_tarjeta_url(@registro_tarjeta),
          params: {
            registro_tarjeta: {
              concepto: @registro_tarjeta.concepto,
              cuenta_id: @registro_tarjeta.cuenta_id,
              estado_registro_tarjeta_id: @registro_tarjeta.estado_registro_tarjeta_id,
              fecha: @registro_tarjeta.fecha,
              importe: @registro_tarjeta.importe
            }
          },
          as: :json
    assert_response :success
  end

  test "should destroy registro_tarjeta" do
    assert_difference("RegistroTarjeta.count", -1) do
      delete registro_tarjeta_url(@registro_tarjeta), as: :json
    end

    assert_response :no_content
  end
end
