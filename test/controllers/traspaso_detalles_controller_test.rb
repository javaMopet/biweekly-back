require "test_helper"

class TraspasoDetallesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @traspaso_detalle = traspaso_detalles(:one)
  end

  test "should get index" do
    get traspaso_detalles_url, as: :json
    assert_response :success
  end

  test "should create traspaso_detalle" do
    assert_difference("TraspasoDetalle.count") do
      post traspaso_detalles_url, params: { traspaso_detalle: { cuenta_id: @traspaso_detalle.cuenta_id, importe: @traspaso_detalle.importe, tipo_cuenta_trasferencia_id: @traspaso_detalle.tipo_cuenta_trasferencia_id, traspaso_id: @traspaso_detalle.traspaso_id } }, as: :json
    end

    assert_response :created
  end

  test "should show traspaso_detalle" do
    get traspaso_detalle_url(@traspaso_detalle), as: :json
    assert_response :success
  end

  test "should update traspaso_detalle" do
    patch traspaso_detalle_url(@traspaso_detalle), params: { traspaso_detalle: { cuenta_id: @traspaso_detalle.cuenta_id, importe: @traspaso_detalle.importe, tipo_cuenta_trasferencia_id: @traspaso_detalle.tipo_cuenta_trasferencia_id, traspaso_id: @traspaso_detalle.traspaso_id } }, as: :json
    assert_response :success
  end

  test "should destroy traspaso_detalle" do
    assert_difference("TraspasoDetalle.count", -1) do
      delete traspaso_detalle_url(@traspaso_detalle), as: :json
    end

    assert_response :no_content
  end
end
