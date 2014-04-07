require 'test_helper'

class ClinicalOutcomesControllerTest < ActionController::TestCase
  setup do
    @clinical_outcome = clinical_outcomes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clinical_outcomes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clinical_outcome" do
    assert_difference('ClinicalOutcome.count') do
      post :create, clinical_outcome: { description: @clinical_outcome.description, medicalrecord_id: @clinical_outcome.medicalrecord_id, observations: @clinical_outcome.observations, status: @clinical_outcome.status }
    end

    assert_redirected_to clinical_outcome_path(assigns(:clinical_outcome))
  end

  test "should show clinical_outcome" do
    get :show, id: @clinical_outcome
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clinical_outcome
    assert_response :success
  end

  test "should update clinical_outcome" do
    patch :update, id: @clinical_outcome, clinical_outcome: { description: @clinical_outcome.description, medicalrecord_id: @clinical_outcome.medicalrecord_id, observations: @clinical_outcome.observations, status: @clinical_outcome.status }
    assert_redirected_to clinical_outcome_path(assigns(:clinical_outcome))
  end

  test "should destroy clinical_outcome" do
    assert_difference('ClinicalOutcome.count', -1) do
      delete :destroy, id: @clinical_outcome
    end

    assert_redirected_to clinical_outcomes_path
  end
end
