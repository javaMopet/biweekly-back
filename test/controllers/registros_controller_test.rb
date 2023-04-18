require "test_helper"

class RegistrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registro = registros(:one)
  end

  test "should get index" do
    get registros_url, as: :json
    assert_response :success
  end

  test "should create registro" do
    assert_difference("Registro.count") do
      post registros_url, params: { registro: { estado_registro_id: @registro.estado_registro_id, fecha: @registro.fecha, importe: @registro.importe, registrable_id: @registro.registrable_id, registrable_type: @registro.registrable_type } }, as: :json
    end

    assert_response :created
  end

  test "should show registro" do
    get registro_url(@registro), as: :json
    assert_response :success
  end

  test "should update registro" do
    patch registro_url(@registro), params: { registro: { estado_registro_id: @registro.estado_registro_id, fecha: @registro.fecha, importe: @registro.importe, registrable_id: @registro.registrable_id, registrable_type: @registro.registrable_type } }, as: :json
    assert_response :success
  end

  test "should destroy registro" do
    assert_difference("Registro.count", -1) do
      delete registro_url(@registro), as: :json
    end

    assert_response :no_content
  end
end
