require "test_helper"

class MovimientosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movimiento = movimientos(:one)
  end

  test "should get index" do
    get movimientos_url, as: :json
    assert_response :success
  end

  test "should create movimiento" do
    assert_difference("Movimiento.count") do
      post movimientos_url, params: { movimiento: { estado_movimiento_id: @movimiento.estado_movimiento_id, fecha: @movimiento.fecha, numero: @movimiento.numero, obsevaciones: @movimiento.obsevaciones, tipo_movimiento_id: @movimiento.tipo_movimiento_id, user_id: @movimiento.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show movimiento" do
    get movimiento_url(@movimiento), as: :json
    assert_response :success
  end

  test "should update movimiento" do
    patch movimiento_url(@movimiento), params: { movimiento: { estado_movimiento_id: @movimiento.estado_movimiento_id, fecha: @movimiento.fecha, numero: @movimiento.numero, obsevaciones: @movimiento.obsevaciones, tipo_movimiento_id: @movimiento.tipo_movimiento_id, user_id: @movimiento.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy movimiento" do
    assert_difference("Movimiento.count", -1) do
      delete movimiento_url(@movimiento), as: :json
    end

    assert_response :no_content
  end
end
