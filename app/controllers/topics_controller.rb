class TopicsController < ApplicationController
  before_filter :has_permission?
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :set_subject
  before_action :set_course

  # GET /topics
  def index
    @topics = @user.topics
  end

  # GET /topics/1
  def show
    @materials = @topic.materials.order('created_at asc')
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  def create
    @topic = @user.topics.new(topic_params)
      if @topic.save
        redirect_to @topic, notice: 'Topic was successfully created.' 
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /topics/1
  def update
      if @topic.update(topic_params)
        redirect_to @topic, notice: 'Topic was successfully updated.'
      else
        render action: 'edit'
    end
  end

  # DELETE /topics/1
  def destroy
    @topic.destroy
    redirect_to topics_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def set_subject
      if params[:subject_id]
        @subject = Subject.find(params[:subject_id])
      end
    end

    def set_course
      if params[:course_id]
        @course = Course.find(params[:course_id])
      end
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title, :decription, :belongs_to)
    end
end
