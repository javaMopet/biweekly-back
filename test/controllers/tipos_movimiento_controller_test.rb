require "test_helper"

class TiposMovimientoControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_movimiento = tipos_movimiento(:one)
  end

  test "should get index" do
    get tipos_movimiento_url, as: :json
    assert_response :success
  end

  test "should create tipo_movimiento" do
    assert_difference("TipoMovimiento.count") do
      post tipos_movimiento_url, params: { tipo_movimiento: { nombre: @tipo_movimiento.nombre } }, as: :json
    end

    assert_response :created
  end

  test "should show tipo_movimiento" do
    get tipo_movimiento_url(@tipo_movimiento), as: :json
    assert_response :success
  end

  test "should update tipo_movimiento" do
    patch tipo_movimiento_url(@tipo_movimiento), params: { tipo_movimiento: { nombre: @tipo_movimiento.nombre } }, as: :json
    assert_response :success
  end

  test "should destroy tipo_movimiento" do
    assert_difference("TipoMovimiento.count", -1) do
      delete tipo_movimiento_url(@tipo_movimiento), as: :json
    end

    assert_response :no_content
  end
end
