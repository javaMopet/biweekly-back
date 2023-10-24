require "test_helper"

class TraspasosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @traspaso = traspasos(:one)
  end

  test "should get index" do
    get traspasos_url, as: :json
    assert_response :success
  end

  test "should create traspaso" do
    assert_difference("Traspaso.count") do
      post traspasos_url, params: { traspaso: { fecha: @traspaso.fecha, observaciones: @traspaso.observaciones, user_id: @traspaso.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show traspaso" do
    get traspaso_url(@traspaso), as: :json
    assert_response :success
  end

  test "should update traspaso" do
    patch traspaso_url(@traspaso), params: { traspaso: { fecha: @traspaso.fecha, observaciones: @traspaso.observaciones, user_id: @traspaso.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy traspaso" do
    assert_difference("Traspaso.count", -1) do
      delete traspaso_url(@traspaso), as: :json
    end

    assert_response :no_content
  end
end
