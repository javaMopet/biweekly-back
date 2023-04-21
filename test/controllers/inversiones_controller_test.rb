require "test_helper"

class InversionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inversion = inversiones(:one)
  end

  test "should get index" do
    get inversiones_url, as: :json
    assert_response :success
  end

  test "should create inversion" do
    assert_difference("Inversion.count") do
      post inversiones_url, params: { inversion: { categoria_id: @inversion.categoria_id, cuenta_id: @inversion.cuenta_id, observaciones: @inversion.observaciones } }, as: :json
    end

    assert_response :created
  end

  test "should show inversion" do
    get inversion_url(@inversion), as: :json
    assert_response :success
  end

  test "should update inversion" do
    patch inversion_url(@inversion), params: { inversion: { categoria_id: @inversion.categoria_id, cuenta_id: @inversion.cuenta_id, observaciones: @inversion.observaciones } }, as: :json
    assert_response :success
  end

  test "should destroy inversion" do
    assert_difference("Inversion.count", -1) do
      delete inversion_url(@inversion), as: :json
    end

    assert_response :no_content
  end
end
