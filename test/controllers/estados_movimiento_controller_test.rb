require "test_helper"

class EstadosMovimientoControllerTest < ActionDispatch::IntegrationTest
  setup do
    @estado_movimiento = estados_movimiento(:one)
  end

  test "should get index" do
    get estados_movimiento_url, as: :json
    assert_response :success
  end

  test "should create estado_movimiento" do
    assert_difference("EstadoMovimiento.count") do
      post estados_movimiento_url, params: { estado_movimiento: { nombre: @estado_movimiento.nombre } }, as: :json
    end

    assert_response :created
  end

  test "should show estado_movimiento" do
    get estado_movimiento_url(@estado_movimiento), as: :json
    assert_response :success
  end

  test "should update estado_movimiento" do
    patch estado_movimiento_url(@estado_movimiento), params: { estado_movimiento: { nombre: @estado_movimiento.nombre } }, as: :json
    assert_response :success
  end

  test "should destroy estado_movimiento" do
    assert_difference("EstadoMovimiento.count", -1) do
      delete estado_movimiento_url(@estado_movimiento), as: :json
    end

    assert_response :no_content
  end
end
