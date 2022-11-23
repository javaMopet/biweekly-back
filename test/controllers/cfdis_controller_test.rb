require "test_helper"

class CfdisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cfdi = cfdis(:one)
  end

  test "should get index" do
    get cfdis_url, as: :json
    assert_response :success
  end

  test "should create cfdi" do
    assert_difference("Cfdi.count") do
      post cfdis_url, params: { cfdi: { rfc_emisor: @cfdi.rfc_emisor, rfc_receptor: @cfdi.rfc_receptor, uuid: @cfdi.uuid } }, as: :json
    end

    assert_response :created
  end

  test "should show cfdi" do
    get cfdi_url(@cfdi), as: :json
    assert_response :success
  end

  test "should update cfdi" do
    patch cfdi_url(@cfdi), params: { cfdi: { rfc_emisor: @cfdi.rfc_emisor, rfc_receptor: @cfdi.rfc_receptor, uuid: @cfdi.uuid } }, as: :json
    assert_response :success
  end

  test "should destroy cfdi" do
    assert_difference("Cfdi.count", -1) do
      delete cfdi_url(@cfdi), as: :json
    end

    assert_response :no_content
  end
end
