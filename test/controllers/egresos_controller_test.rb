require "test_helper"

class EgresosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @egreso = egresos(:one)
  end

  test "should get index" do
    get egresos_url, as: :json
    assert_response :success
  end

  test "should create egreso" do
    assert_difference("Egreso.count") do
      post egresos_url,
           params: {
             egreso: {
               categoria_id: @egreso.categoria_id,
               cuenta_id: @egreso.cuenta_id,
               observaciones: @egreso.observaciones
             }
           },
           as: :json
    end

    assert_response :created
  end

  test "should show egreso" do
    get egreso_url(@egreso), as: :json
    assert_response :success
  end

  test "should update egreso" do
    patch egreso_url(@egreso),
          params: {
            egreso: {
              categoria_id: @egreso.categoria_id,
              cuenta_id: @egreso.cuenta_id,
              observaciones: @egreso.observaciones
            }
          },
          as: :json
    assert_response :success
  end

  test "should destroy egreso" do
    assert_difference("Egreso.count", -1) do
      delete egreso_url(@egreso), as: :json
    end

    assert_response :no_content
  end
end
