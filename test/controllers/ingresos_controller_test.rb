require "test_helper"

class IngresosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ingreso = ingresos(:one)
  end

  test "should get index" do
    get ingresos_url, as: :json
    assert_response :success
  end

  test "should create ingreso" do
    assert_difference("Ingreso.count") do
      post ingresos_url,
           params: {
             ingreso: {
               categoria_id: @ingreso.categoria_id,
               cuenta_id: @ingreso.cuenta_id,
               observaciones: @ingreso.observaciones
             }
           },
           as: :json
    end

    assert_response :created
  end

  test "should show ingreso" do
    get ingreso_url(@ingreso), as: :json
    assert_response :success
  end

  test "should update ingreso" do
    patch ingreso_url(@ingreso),
          params: {
            ingreso: {
              categoria_id: @ingreso.categoria_id,
              cuenta_id: @ingreso.cuenta_id,
              observaciones: @ingreso.observaciones
            }
          },
          as: :json
    assert_response :success
  end

  test "should destroy ingreso" do
    assert_difference("Ingreso.count", -1) do
      delete ingreso_url(@ingreso), as: :json
    end

    assert_response :no_content
  end
end
