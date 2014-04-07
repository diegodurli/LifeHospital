require 'test_helper'

class InventoryMovementsControllerTest < ActionController::TestCase
  setup do
    @inventory_movement = inventory_movements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inventory_movements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inventory_movement" do
    assert_difference('InventoryMovement.count') do
      post :create, inventory_movement: { inventory_id: @inventory_movement.inventory_id, medicament_id: @inventory_movement.medicament_id, quantity: @inventory_movement.quantity, total_value: @inventory_movement.total_value, type: @inventory_movement.type, unit_value: @inventory_movement.unit_value }
    end

    assert_redirected_to inventory_movement_path(assigns(:inventory_movement))
  end

  test "should show inventory_movement" do
    get :show, id: @inventory_movement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inventory_movement
    assert_response :success
  end

  test "should update inventory_movement" do
    patch :update, id: @inventory_movement, inventory_movement: { inventory_id: @inventory_movement.inventory_id, medicament_id: @inventory_movement.medicament_id, quantity: @inventory_movement.quantity, total_value: @inventory_movement.total_value, type: @inventory_movement.type, unit_value: @inventory_movement.unit_value }
    assert_redirected_to inventory_movement_path(assigns(:inventory_movement))
  end

  test "should destroy inventory_movement" do
    assert_difference('InventoryMovement.count', -1) do
      delete :destroy, id: @inventory_movement
    end

    assert_redirected_to inventory_movements_path
  end
end
