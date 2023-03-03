require "test_helper"

class DetallesRegistroControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detall_registro = detalles_registro(:one)
  end

  test "should get index" do
    get detalles_registro_url, as: :json
    assert_response :success
  end

  test "should create detall_registro" do
    assert_difference("DetalleRegistro.count") do
      post detalles_registro_url, params: { detall_registro: { cuenta_contable_id: @detall_registro.cuenta_contable_id, importe_absoluto: @detall_registro.importe_absoluto, importe_real: @detall_registro.importe_real, observaciones: @detall_registro.observaciones, registrable_id: @detall_registro.registrable_id, registrable_type: @detall_registro.registrable_type, registro_id: @detall_registro.registro_id, tipo_afectacion: @detall_registro.tipo_afectacion } }, as: :json
    end

    assert_response :created
  end

  test "should show detall_registro" do
    get detall_registro_url(@detall_registro), as: :json
    assert_response :success
  end

  test "should update detall_registro" do
    patch detall_registro_url(@detall_registro), params: { detall_registro: { cuenta_contable_id: @detall_registro.cuenta_contable_id, importe_absoluto: @detall_registro.importe_absoluto, importe_real: @detall_registro.importe_real, observaciones: @detall_registro.observaciones, registrable_id: @detall_registro.registrable_id, registrable_type: @detall_registro.registrable_type, registro_id: @detall_registro.registro_id, tipo_afectacion: @detall_registro.tipo_afectacion } }, as: :json
    assert_response :success
  end

  test "should destroy detall_registro" do
    assert_difference("DetalleRegistro.count", -1) do
      delete detall_registro_url(@detall_registro), as: :json
    end

    assert_response :no_content
  end
end
