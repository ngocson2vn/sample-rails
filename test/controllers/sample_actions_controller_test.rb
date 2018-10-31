require 'test_helper'

class SampleActionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sample_action = sample_actions(:one)
  end

  test "should get index" do
    get sample_actions_url
    assert_response :success
  end

  test "should get new" do
    get new_sample_action_url
    assert_response :success
  end

  test "should create sample_action" do
    assert_difference('SampleAction.count') do
      post sample_actions_url, params: { sample_action: { age: @sample_action.age, name: @sample_action.name } }
    end

    assert_redirected_to sample_action_url(SampleAction.last)
  end

  test "should show sample_action" do
    get sample_action_url(@sample_action)
    assert_response :success
  end

  test "should get edit" do
    get edit_sample_action_url(@sample_action)
    assert_response :success
  end

  test "should update sample_action" do
    patch sample_action_url(@sample_action), params: { sample_action: { age: @sample_action.age, name: @sample_action.name } }
    assert_redirected_to sample_action_url(@sample_action)
  end

  test "should destroy sample_action" do
    assert_difference('SampleAction.count', -1) do
      delete sample_action_url(@sample_action)
    end

    assert_redirected_to sample_actions_url
  end
end
