require "test_helper"

class BancosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @banco = bancos(:one)
  end

  test "should get index" do
    get bancos_url, as: :json
    assert_response :success
  end

  test "should create banco" do
    assert_difference("Banco.count") do
      post bancos_url, params: { banco: { icono: @banco.icono, nombre: @banco.nombre } }, as: :json
    end

    assert_response :created
  end

  test "should show banco" do
    get banco_url(@banco), as: :json
    assert_response :success
  end

  test "should update banco" do
    patch banco_url(@banco), params: { banco: { icono: @banco.icono, nombre: @banco.nombre } }, as: :json
    assert_response :success
  end

  test "should destroy banco" do
    assert_difference("Banco.count", -1) do
      delete banco_url(@banco), as: :json
    end

    assert_response :no_content
  end
end
