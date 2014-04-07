require 'test_helper'

class SerumsControllerTest < ActionController::TestCase
  setup do
    @serum = serums(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:serums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create serum" do
    assert_difference('Serum.count') do
      post :create, serum: { description: @serum.description }
    end

    assert_redirected_to serum_path(assigns(:serum))
  end

  test "should show serum" do
    get :show, id: @serum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @serum
    assert_response :success
  end

  test "should update serum" do
    patch :update, id: @serum, serum: { description: @serum.description }
    assert_redirected_to serum_path(assigns(:serum))
  end

  test "should destroy serum" do
    assert_difference('Serum.count', -1) do
      delete :destroy, id: @serum
    end

    assert_redirected_to serums_path
  end
end
