require 'test_helper'

class SubjectTopicsControllerTest < ActionController::TestCase
  setup do
    @subject_topic = subject_topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subject_topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subject_topic" do
    assert_difference('SubjectTopic.count') do
      post :create, subject_topic: { subject_id: @subject_topic.subject_id, topic_id: @subject_topic.topic_id }
    end

    assert_redirected_to subject_topic_path(assigns(:subject_topic))
  end

  test "should show subject_topic" do
    get :show, id: @subject_topic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subject_topic
    assert_response :success
  end

  test "should update subject_topic" do
    patch :update, id: @subject_topic, subject_topic: { subject_id: @subject_topic.subject_id, topic_id: @subject_topic.topic_id }
    assert_redirected_to subject_topic_path(assigns(:subject_topic))
  end

  test "should destroy subject_topic" do
    assert_difference('SubjectTopic.count', -1) do
      delete :destroy, id: @subject_topic
    end

    assert_redirected_to subject_topics_path
  end
end
