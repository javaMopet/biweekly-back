require "test_helper"

class DetallesMovimientoControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detalle_movimiento = detalles_movimiento(:one)
  end

  test "should get index" do
    get detalles_movimiento_url, as: :json
    assert_response :success
  end

  test "should create detalle_movimiento" do
    assert_difference("DetalleMovimiento.count") do
      post detalles_movimiento_url, params: { detalle_movimiento: { categoria_id: @detalle_movimiento.categoria_id, cuenta_contable_banco_id: @detalle_movimiento.cuenta_contable_banco_id, cuenta_contable_categoria_id: @detalle_movimiento.cuenta_contable_categoria_id, cuenta_id: @detalle_movimiento.cuenta_id, importe: @detalle_movimiento.importe, movimiento_id: @detalle_movimiento.movimiento_id, tipo_afectacion: @detalle_movimiento.tipo_afectacion } }, as: :json
    end

    assert_response :created
  end

  test "should show detalle_movimiento" do
    get detalle_movimiento_url(@detalle_movimiento), as: :json
    assert_response :success
  end

  test "should update detalle_movimiento" do
    patch detalle_movimiento_url(@detalle_movimiento), params: { detalle_movimiento: { categoria_id: @detalle_movimiento.categoria_id, cuenta_contable_banco_id: @detalle_movimiento.cuenta_contable_banco_id, cuenta_contable_categoria_id: @detalle_movimiento.cuenta_contable_categoria_id, cuenta_id: @detalle_movimiento.cuenta_id, importe: @detalle_movimiento.importe, movimiento_id: @detalle_movimiento.movimiento_id, tipo_afectacion: @detalle_movimiento.tipo_afectacion } }, as: :json
    assert_response :success
  end

  test "should destroy detalle_movimiento" do
    assert_difference("DetalleMovimiento.count", -1) do
      delete detalle_movimiento_url(@detalle_movimiento), as: :json
    end

    assert_response :no_content
  end
end
