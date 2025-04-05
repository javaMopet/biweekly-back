require "test_helper"

class CortesCuentaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @corte_cuenta = cortes_cuenta(:one)
  end

  test "should get index" do
    get cortes_cuenta_url, as: :json
    assert_response :success
  end

  test "should create corte_cuenta" do
    assert_difference("CorteCuenta.count") do
      post cortes_cuenta_url,
           params: {
             corte_cuenta: {
               estatus: @corte_cuenta.estatus,
               fecha_final: @corte_cuenta.fecha_final,
               fecha_inicial: @corte_cuenta.fecha_inicial,
               saldo_final: @corte_cuenta.saldo_final,
               saldo_inicial: @corte_cuenta.saldo_inicial
             }
           },
           as: :json
    end

    assert_response :created
  end

  test "should show corte_cuenta" do
    get corte_cuenta_url(@corte_cuenta), as: :json
    assert_response :success
  end

  test "should update corte_cuenta" do
    patch corte_cuenta_url(@corte_cuenta),
          params: {
            corte_cuenta: {
              estatus: @corte_cuenta.estatus,
              fecha_final: @corte_cuenta.fecha_final,
              fecha_inicial: @corte_cuenta.fecha_inicial,
              saldo_final: @corte_cuenta.saldo_final,
              saldo_inicial: @corte_cuenta.saldo_inicial
            }
          },
          as: :json
    assert_response :success
  end

  test "should destroy corte_cuenta" do
    assert_difference("CorteCuenta.count", -1) do
      delete corte_cuenta_url(@corte_cuenta), as: :json
    end

    assert_response :no_content
  end
end
