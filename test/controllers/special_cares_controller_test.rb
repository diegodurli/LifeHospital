require 'test_helper'

class SpecialCaresControllerTest < ActionController::TestCase
  setup do
    @special_care = special_cares(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:special_cares)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create special_care" do
    assert_difference('SpecialCare.count') do
      post :create, special_care: { desactivation: @special_care.desactivation, description: @special_care.description, hospitalization_id: @special_care.hospitalization_id }
    end

    assert_redirected_to special_care_path(assigns(:special_care))
  end

  test "should show special_care" do
    get :show, id: @special_care
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @special_care
    assert_response :success
  end

  test "should update special_care" do
    patch :update, id: @special_care, special_care: { desactivation: @special_care.desactivation, description: @special_care.description, hospitalization_id: @special_care.hospitalization_id }
    assert_redirected_to special_care_path(assigns(:special_care))
  end

  test "should destroy special_care" do
    assert_difference('SpecialCare.count', -1) do
      delete :destroy, id: @special_care
    end

    assert_redirected_to special_cares_path
  end
end
