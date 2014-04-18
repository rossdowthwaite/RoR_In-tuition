require 'test_helper'

class CourseWallsControllerTest < ActionController::TestCase
  setup do
    @course_wall = course_walls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_walls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_wall" do
    assert_difference('CourseWall.count') do
      post :create, course_wall: { course_id: @course_wall.course_id, post_id: @course_wall.post_id }
    end

    assert_redirected_to course_wall_path(assigns(:course_wall))
  end

  test "should show course_wall" do
    get :show, id: @course_wall
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_wall
    assert_response :success
  end

  test "should update course_wall" do
    patch :update, id: @course_wall, course_wall: { course_id: @course_wall.course_id, post_id: @course_wall.post_id }
    assert_redirected_to course_wall_path(assigns(:course_wall))
  end

  test "should destroy course_wall" do
    assert_difference('CourseWall.count', -1) do
      delete :destroy, id: @course_wall
    end

    assert_redirected_to course_walls_path
  end
end
