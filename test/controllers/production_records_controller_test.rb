require 'test_helper'

class ProductionRecordsControllerTest < ActionController::TestCase
  setup do
    @production_record = production_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:production_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create production_record" do
    assert_difference('ProductionRecord.count') do
      post :create, production_record: { finish: @production_record.finish, quantity: @production_record.quantity, start: @production_record.start }
    end

    assert_redirected_to production_record_path(assigns(:production_record))
  end

  test "should show production_record" do
    get :show, id: @production_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @production_record
    assert_response :success
  end

  test "should update production_record" do
    patch :update, id: @production_record, production_record: { finish: @production_record.finish, quantity: @production_record.quantity, start: @production_record.start }
    assert_redirected_to production_record_path(assigns(:production_record))
  end

  test "should destroy production_record" do
    assert_difference('ProductionRecord.count', -1) do
      delete :destroy, id: @production_record
    end

    assert_redirected_to production_records_path
  end
end
