require 'test_helper'

class ArticleGroupsControllerTest < ActionController::TestCase
  setup do
    @article_group = article_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:article_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article_group" do
    assert_difference('ArticleGroup.count') do
      post :create, article_group: { code: @article_group.code, name: @article_group.name }
    end

    assert_redirected_to article_group_path(assigns(:article_group))
  end

  test "should show article_group" do
    get :show, id: @article_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @article_group
    assert_response :success
  end

  test "should update article_group" do
    patch :update, id: @article_group, article_group: { code: @article_group.code, name: @article_group.name }
    assert_redirected_to article_group_path(assigns(:article_group))
  end

  test "should destroy article_group" do
    assert_difference('ArticleGroup.count', -1) do
      delete :destroy, id: @article_group
    end

    assert_redirected_to article_groups_path
  end
end
