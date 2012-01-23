require 'test_helper'

class ContextRulesControllerTest < ActionController::TestCase
  setup do
    @context_rule = context_rules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:context_rules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create context_rule" do
    assert_difference('ContextRule.count') do
      post :create, :context_rule => @context_rule.attributes
    end

    assert_redirected_to context_rule_path(assigns(:context_rule))
  end

  test "should show context_rule" do
    get :show, :id => @context_rule.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @context_rule.to_param
    assert_response :success
  end

  test "should update context_rule" do
    put :update, :id => @context_rule.to_param, :context_rule => @context_rule.attributes
    assert_redirected_to context_rule_path(assigns(:context_rule))
  end

  test "should destroy context_rule" do
    assert_difference('ContextRule.count', -1) do
      delete :destroy, :id => @context_rule.to_param
    end

    assert_redirected_to context_rules_path
  end
end
