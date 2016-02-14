require 'test_helper'

class WorkStepsControllerTest < ActionController::TestCase
  setup do
    @work_step = work_steps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_steps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_step" do
    assert_difference('WorkStep.count') do
      post :create, work_step: { name: @work_step.name }
    end

    assert_redirected_to work_step_path(assigns(:work_step))
  end

  test "should show work_step" do
    get :show, id: @work_step
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work_step
    assert_response :success
  end

  test "should update work_step" do
    patch :update, id: @work_step, work_step: { name: @work_step.name }
    assert_redirected_to work_step_path(assigns(:work_step))
  end

  test "should destroy work_step" do
    assert_difference('WorkStep.count', -1) do
      delete :destroy, id: @work_step
    end

    assert_redirected_to work_steps_path
  end
end
