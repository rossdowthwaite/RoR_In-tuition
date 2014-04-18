class PostsController < ApplicationController
  before_filter :has_permission?
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_course
  before_action :set_forum

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    session[:return_to] ||= request.referer
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @course 
      @course.posts << @post
    else
      @forum.posts << @post
    end

    if @post.save
      redirect_to :back, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /posts/1
  def update
      if @post.update(post_params)
        redirect_to session.delete(:return_to)
      else
        render action: 'edit'
      end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_course
      if params[:course_id]
        @course = Course.find(params[:course_id])
      end
    end

    def set_forum
      if params[:forum_id]
        @forum = Forum.find(params[:forum_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :content)
    end
end
