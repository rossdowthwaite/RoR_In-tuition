class ForumsController < ApplicationController
  before_filter :has_permission?
  before_action :set_forum, only: [:show, :edit, :update, :destroy, :add_participant, :settings]
  before_action :set_user

  # GET /forums
  # GET /forums.json
  def index
    @forums = @user.forums
  end

  # GET /forums/1
  # GET /forums/1.json
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
  # POST /forums.json
  def create
    @forum = Forum.new(forum_params)
    @user.forums << @forum

    respond_to do |format|
      if @forum.save
        format.html { redirect_to @forum, notice: 'Forum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @forum }
      else
        format.html { render action: 'new' }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forums/1
  # PATCH/PUT /forums/1.json
  def update
    respond_to do |format|
      if @forum.update(forum_params)
        format.html { redirect_to @forum, notice: 'Forum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /forums/1
  # DELETE /forums/1.json
  def destroy
    @forum.destroy
    respond_to do |format|
      format.html { redirect_to forums_url }
      format.json { head :no_content }
    end
  end

  def add_participant
    @users = User.all
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
