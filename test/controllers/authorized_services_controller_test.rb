require 'test_helper'

class SampleAuthorizedServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @authorized_service = authorized_services(:one)
  end

  test "should get index" do
    get authorized_services_url
    assert_response :success
  end

  test "should get new" do
    get new_authorized_service_url
    assert_response :success
  end

  test "should create authorized_service" do
    assert_difference('AuthorizedService.count') do
      post authorized_services_url, params: { authorized_service: { application_name: @authorized_service.application_name, application_token: @authorized_service.application_token, old_application_token: @authorized_service.old_application_token, valid_until: @authorized_service.valid_until } }
    end

    assert_redirected_to authorized_service_url(AuthorizedService.last)
  end

  test "should show authorized_service" do
    get authorized_service_url(@authorized_service)
    assert_response :success
  end

  test "should get edit" do
    get edit_authorized_service_url(@authorized_service)
    assert_response :success
  end

  test "should update authorized_service" do
    patch authorized_service_url(@authorized_service), params: { authorized_service: { application_name: @authorized_service.application_name, application_token: @authorized_service.application_token, old_application_token: @authorized_service.old_application_token, valid_until: @authorized_service.valid_until } }
    assert_redirected_to authorized_service_url(@authorized_service)
  end

  test "should destroy authorized_service" do
    assert_difference('AuthorizedService.count', -1) do
      delete authorized_service_url(@authorized_service)
    end

    assert_redirected_to authorized_services_url
  end
end
