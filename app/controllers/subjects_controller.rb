class SubjectsController < ApplicationController
  before_filter :has_permission?
  before_action :set_course
  before_action :set_subject, only: [:show, :edit, :update, :destroy, :add_topics]
  before_action :set_user

  # GET /subjects
  def index
    @subjects = @user.subjects
  end

  # GET /subjects/1
  def show
    @topics = @subject.topics
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  def create
    @subject = @user.subjects.new(subject_params)
      if @subject.save
        redirect_to subjects_path, notice: 'Subject was successfully created.'
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /subjects/1
  def update
      if @subject.update(subject_params)
        redirect_to @subject, notice: 'Subject was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy
    redirect_to subjects_url
  end

  def add_topics
    @topics = current_user.topics
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      if @course
        @subject = @course.subjects.find(params[:id])
      else
        @subject = Subject.find(params[:id])
      end
    end

    def set_user
      @user = current_user
    end

    def set_course
      if params[:course_id]
        @course = Course.find(params[:course_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:title, :description, :user_id, :topic_ids => [])
    end
end
