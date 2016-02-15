require 'test_helper'

class ProductionWorkStepsControllerTest < ActionController::TestCase
  setup do
    @production_work_step = production_work_steps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:production_work_steps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create production_work_step" do
    assert_difference('ProductionWorkStep.count') do
      post :create, production_work_step: { name: @production_work_step.name }
    end

    assert_redirected_to production_work_step_path(assigns(:production_work_step))
  end

  test "should show production_work_step" do
    get :show, id: @production_work_step
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @production_work_step
    assert_response :success
  end

  test "should update production_work_step" do
    patch :update, id: @production_work_step, production_work_step: { name: @production_work_step.name }
    assert_redirected_to production_work_step_path(assigns(:production_work_step))
  end

  test "should destroy production_work_step" do
    assert_difference('ProductionWorkStep.count', -1) do
      delete :destroy, id: @production_work_step
    end

    assert_redirected_to production_work_steps_path
  end
end
