require 'test_helper'

class CourseItemsControllerTest < ActionController::TestCase
  setup do
    @course_item = course_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_item" do
    assert_difference('CourseItem.count') do
      post :create, course_item: { course_id: @course_item.course_id, product_id: @course_item.product_id, show_in_profile: @course_item.show_in_profile }
    end

    assert_redirected_to course_item_path(assigns(:course_item))
  end

  test "should show course_item" do
    get :show, id: @course_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_item
    assert_response :success
  end

  test "should update course_item" do
    patch :update, id: @course_item, course_item: { course_id: @course_item.course_id, product_id: @course_item.product_id, show_in_profile: @course_item.show_in_profile }
    assert_redirected_to course_item_path(assigns(:course_item))
  end

  test "should destroy course_item" do
    assert_difference('CourseItem.count', -1) do
      delete :destroy, id: @course_item
    end

    assert_redirected_to course_items_path
  end
end
