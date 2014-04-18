class VideosController < ApplicationController
  before_filter :has_permission?
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  before_action :set_topic
  before_action :set_user

  # GET /videos
  # GET /videos.json
  def index
    @videos = @user.videos
  end

  # GET /videos/1
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
    session[:return_to] ||= request.referer
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  def create
    @video = @user.videos.new(video_params)
    if @topic
      @topic.video_mediums << @video
    else
      @video.save
    end
    redirect_to session.delete(:return_to)
  end

  # PATCH/PUT /videos/1
  def update
      if @video.update(video_params)
        redirect_to @video, notice: 'Video was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    redirect_to videos_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    def set_topic
      if params[:topic_id]
        @topic = Topic.find(params[:topic_id])
      end
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:user_id, :title, :video_url)
    end
end
