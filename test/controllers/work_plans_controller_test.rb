require 'test_helper'

class WorkPlansControllerTest < ActionController::TestCase
  setup do
    @work_plan = work_plans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_plans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_plan" do
    assert_difference('WorkPlan.count') do
      post :create, work_plan: { description: @work_plan.description, is_standard: @work_plan.is_standard, name: @work_plan.name }
    end

    assert_redirected_to work_plan_path(assigns(:work_plan))
  end

  test "should show work_plan" do
    get :show, id: @work_plan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_plan
    assert_response :success
  end

  test "should update work_plan" do
    patch :update, id: @work_plan, work_plan: { description: @work_plan.description, is_standard: @work_plan.is_standard, name: @work_plan.name }
    assert_redirected_to work_plan_path(assigns(:work_plan))
  end

  test "should destroy work_plan" do
    assert_difference('WorkPlan.count', -1) do
      delete :destroy, id: @work_plan
    end

    assert_redirected_to work_plans_path
  end
end
