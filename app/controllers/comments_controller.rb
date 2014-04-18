class CommentsController < ApplicationController
  before_filter :has_permission?
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    session[:return_to] ||= request.referer
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to :back, notice: 'Comment was successfully created.'
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /comments/1
  def update
      if @comment.update(comment_params)
        redirect_to session.delete(:return_to)
      else
        render action: 'edit'
      end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :commentable_id, :commentable_type, :content)
    end
end
