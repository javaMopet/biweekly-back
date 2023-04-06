require "test_helper"

class TiposCuentaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_cuenta = tipos_cuenta(:one)
  end

  test "should get index" do
    get tipos_cuenta_url, as: :json
    assert_response :success
  end

  test "should create tipo_cuenta" do
    assert_difference("TipoCuenta.count") do
      post tipos_cuenta_url, params: { tipo_cuenta: { nombre: @tipo_cuenta.nombre } }, as: :json
    end

    assert_response :created
  end

  test "should show tipo_cuenta" do
    get tipo_cuenta_url(@tipo_cuenta), as: :json
    assert_response :success
  end

  test "should update tipo_cuenta" do
    patch tipo_cuenta_url(@tipo_cuenta), params: { tipo_cuenta: { nombre: @tipo_cuenta.nombre } }, as: :json
    assert_response :success
  end

  test "should destroy tipo_cuenta" do
    assert_difference("TipoCuenta.count", -1) do
      delete tipo_cuenta_url(@tipo_cuenta), as: :json
    end

    assert_response :no_content
  end
end
