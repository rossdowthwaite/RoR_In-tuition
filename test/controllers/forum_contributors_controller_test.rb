require 'test_helper'

class ForumContributorsControllerTest < ActionController::TestCase
  setup do
    @forum_contributor = forum_contributors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forum_contributors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forum_contributor" do
    assert_difference('ForumContributor.count') do
      post :create, forum_contributor: { contributor_id: @forum_contributor.contributor_id, forum_id: @forum_contributor.forum_id }
    end

    assert_redirected_to forum_contributor_path(assigns(:forum_contributor))
  end

  test "should show forum_contributor" do
    get :show, id: @forum_contributor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forum_contributor
    assert_response :success
  end

  test "should update forum_contributor" do
    patch :update, id: @forum_contributor, forum_contributor: { contributor_id: @forum_contributor.contributor_id, forum_id: @forum_contributor.forum_id }
    assert_redirected_to forum_contributor_path(assigns(:forum_contributor))
  end

  test "should destroy forum_contributor" do
    assert_difference('ForumContributor.count', -1) do
      delete :destroy, id: @forum_contributor
    end

    assert_redirected_to forum_contributors_path
  end
end
