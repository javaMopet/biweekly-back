require "test_helper"

class CuentasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cuenta = cuentas(:one)
  end

  test "should get index" do
    get cuentas_url, as: :json
    assert_response :success
  end

  test "should create cuenta" do
    assert_difference("Cuenta.count") do
      post cuentas_url,
           params: {
             cuenta: {
               cuenta_contable_id: @cuenta.cuenta_contable_id,
               descripcion: @cuenta.descripcion,
               nombre: @cuenta.nombre
             }
           },
           as: :json
    end

    assert_response :created
  end

  test "should show cuenta" do
    get cuenta_url(@cuenta), as: :json
    assert_response :success
  end

  test "should update cuenta" do
    patch cuenta_url(@cuenta),
          params: {
            cuenta: {
              cuenta_contable_id: @cuenta.cuenta_contable_id,
              descripcion: @cuenta.descripcion,
              nombre: @cuenta.nombre
            }
          },
          as: :json
    assert_response :success
  end

  test "should destroy cuenta" do
    assert_difference("Cuenta.count", -1) do
      delete cuenta_url(@cuenta), as: :json
    end

    assert_response :no_content
  end
end
