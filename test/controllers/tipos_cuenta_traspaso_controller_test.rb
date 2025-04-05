require "test_helper"

class TiposCuentaTraspasoControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipo_cuenta_traspaso = tipos_cuenta_traspaso(:one)
  end

  test "should get index" do
    get tipos_cuenta_traspaso_url, as: :json
    assert_response :success
  end

  test "should create tipo_cuenta_traspaso" do
    assert_difference("TipoCuentaTraspaso.count") do
      post tipos_cuenta_traspaso_url,
           params: { tipo_cuenta_traspaso: { nombre: @tipo_cuenta_traspaso.nombre } },
           as: :json
    end

    assert_response :created
  end

  test "should show tipo_cuenta_traspaso" do
    get tipo_cuenta_traspaso_url(@tipo_cuenta_traspaso), as: :json
    assert_response :success
  end

  test "should update tipo_cuenta_traspaso" do
    patch tipo_cuenta_traspaso_url(@tipo_cuenta_traspaso),
          params: { tipo_cuenta_traspaso: { nombre: @tipo_cuenta_traspaso.nombre } },
          as: :json
    assert_response :success
  end

  test "should destroy tipo_cuenta_traspaso" do
    assert_difference("TipoCuentaTraspaso.count", -1) do
      delete tipo_cuenta_traspaso_url(@tipo_cuenta_traspaso), as: :json
    end

    assert_response :no_content
  end
end
