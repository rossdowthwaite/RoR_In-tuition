class UploadsController < ApplicationController
  before_filter :has_permission?
  before_action :set_upload, only: [:show, :edit, :update, :destroy]
  before_action :set_topic
  before_action :set_user

  # GET /uploads
  def index
    @uploads = @user.uploads
  end

  # GET /uploads/1
  def show
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
    session[:return_to] ||= request.referer
  end

  # GET /uploads/1/edit
  def edit
  end

  # POST /uploads
  def create
    @upload = @user.uploads.new(upload_params)
    if @topic
      @topic.upload_mediums << @upload
    else
      @upload.save
    end
    redirect_to session.delete(:return_to)
  end

  # PATCH/PUT /uploads/1
  def update
      if @upload.update(upload_params)
        if @topic
          redirect_to session.delete(:return_to)
        else
          redirect_to uploads_path
        end
      else
        render action: 'edit'
      end
  end

  # DELETE /uploads/1
  def destroy
    @upload.destroy
    redirect_to uploads_url
  end

  def images
    
  end

  def documents

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
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
    def upload_params
      params.require(:upload).permit(:title, :upload, :user_id)
    end
end
