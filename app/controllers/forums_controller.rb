class ForumsController < ApplicationController
  before_filter :has_permission?
  before_action :set_forum, only: [:show, :edit, :update, :destroy, :add_participant, :settings]
  before_action :set_user

  # GET /forums
  def index
    @forums = @user.forums
  end

  # GET /forums/1
  def show
    @posts = @forum.posts.order("created_at desc")
    @post = Post.new
  end

  # GET /forums/new
  def new
    @forum = Forum.new
  end

  # GET /forums/1/edit
  def edit
  end

  # POST /forums
  def create
    @forum = Forum.new(forum_params)
    @user.forums << @forum

      if @forum.save
        redirect_to @forum, notice: 'Forum was successfully created.'
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /forums/1
  def update
      if @forum.update(forum_params)
        redirect_to @forum, notice: 'Forum was successfully updated.'
      else
        render action: 'edit'
      end
  end


  # DELETE /forums/1
  def destroy
    @forum.destroy
    redirect_to forums_url
  end

  def add_participant
    @students = current_user.students.pluck(:pupil_id)
    @users = User.where(:id => @students)
  end

  def settings
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum
      @forum = Forum.find(params[:id])
    end

    def set_user
      @user  = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_params
      params.require(:forum).permit(:title, :description, :user_id, :avatar, :course_id, :user_ids => [])
    end
end
