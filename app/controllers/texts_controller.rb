class TextsController < ApplicationController
  before_action :set_text, only: [:show, :edit, :update, :destroy]
  before_action :set_topic
  before_action :set_user

  # GET /texts
  def index
    @texts = Text.all
  end

  # GET /texts/1
  def show
  end

  # GET /texts/new
  def new
    @text = Text.new
  end

  # GET /texts/1/edit
  def edit
    @topics = @text.topics
  end

  # POST /texts
  def create
    @text = @user.texts.new(text_params)
    if @topic
      @topic.text_mediums << @text
    end
    redirect_to :back
  end

  # PATCH/PUT /texts/1
  def update
      if @text.update(text_params)
         redirect_to @text, notice: 'Text was successfully updated.' 
      else
        render action: 'edit' 
      end
  end

  # DELETE /texts/1
  def destroy
    @text.destroy
    redirect_to texts_url 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text
      @text = Text.find(params[:id])
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
    def text_params
      params.require(:text).permit(:title, :content, :user_id)
    end
end
