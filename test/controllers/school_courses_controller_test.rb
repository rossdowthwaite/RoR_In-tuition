require 'test_helper'

class SchoolCoursesControllerTest < ActionController::TestCase
  setup do
    @school_course = school_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_course" do
    assert_difference('SchoolCourse.count') do
      post :create, school_course: { course_id: @school_course.course_id, school_id: @school_course.school_id }
    end

    assert_redirected_to school_course_path(assigns(:school_course))
  end

  test "should show school_course" do
    get :show, id: @school_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @school_course
    assert_response :success
  end

  test "should update school_course" do
    patch :update, id: @school_course, school_course: { course_id: @school_course.course_id, school_id: @school_course.school_id }
    assert_redirected_to school_course_path(assigns(:school_course))
  end

  test "should destroy school_course" do
    assert_difference('SchoolCourse.count', -1) do
      delete :destroy, id: @school_course
    end

    assert_redirected_to school_courses_path
  end
end
