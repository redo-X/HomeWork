require 'test_helper'

class ProductionOrdersControllerTest < ActionController::TestCase
  setup do
    @production_order = production_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:production_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create production_order" do
    assert_difference('ProductionOrder.count') do
      post :create, production_order: { description: @production_order.description, due_date: @production_order.due_date, isCompleted: @production_order.isCompleted, number: @production_order.number, pending_quantity: @production_order.pending_quantity, quantity: @production_order.quantity, release_date: @production_order.release_date }
    end

    assert_redirected_to production_order_path(assigns(:production_order))
  end

  test "should show production_order" do
    get :show, id: @production_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @production_order
    assert_response :success
  end

  test "should update production_order" do
    patch :update, id: @production_order, production_order: { description: @production_order.description, due_date: @production_order.due_date, isCompleted: @production_order.isCompleted, number: @production_order.number, pending_quantity: @production_order.pending_quantity, quantity: @production_order.quantity, release_date: @production_order.release_date }
    assert_redirected_to production_order_path(assigns(:production_order))
  end

  test "should destroy production_order" do
    assert_difference('ProductionOrder.count', -1) do
      delete :destroy, id: @production_order
    end

    assert_redirected_to production_orders_path
  end
end
