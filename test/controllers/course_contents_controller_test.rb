require 'test_helper'

class CourseContentsControllerTest < ActionController::TestCase
  setup do
    @course_content = course_contents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:course_contents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course_content" do
    assert_difference('CourseContent.count') do
      post :create, course_content: { course_id: @course_content.course_id, subject_id: @course_content.subject_id }
    end

    assert_redirected_to course_content_path(assigns(:course_content))
  end

  test "should show course_content" do
    get :show, id: @course_content
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course_content
    assert_response :success
  end

  test "should update course_content" do
    patch :update, id: @course_content, course_content: { course_id: @course_content.course_id, subject_id: @course_content.subject_id }
    assert_redirected_to course_content_path(assigns(:course_content))
  end

  test "should destroy course_content" do
    assert_difference('CourseContent.count', -1) do
      delete :destroy, id: @course_content
    end

    assert_redirected_to course_contents_path
  end
end
