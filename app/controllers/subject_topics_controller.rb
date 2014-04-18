class SubjectTopicsController < ApplicationController
  before_action :set_subject_topic, only: [:show, :edit, :update, :destroy]

  # GET /subject_topics
  # GET /subject_topics.json
  def index
    @subject_topics = SubjectTopic.all
  end

  # GET /subject_topics/1
  # GET /subject_topics/1.json
  def show
  end

  # GET /subject_topics/new
  def new
    @subject_topic = SubjectTopic.new
  end

  # GET /subject_topics/1/edit
  def edit
  end

  # POST /subject_topics
  # POST /subject_topics.json
  def create
    @subject_topic = SubjectTopic.new(subject_topic_params)

    respond_to do |format|
      if @subject_topic.save
        format.html { redirect_to @subject_topic, notice: 'Subject topic was successfully created.' }
        format.json { render action: 'show', status: :created, location: @subject_topic }
      else
        format.html { render action: 'new' }
        format.json { render json: @subject_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subject_topics/1
  # PATCH/PUT /subject_topics/1.json
  def update
    respond_to do |format|
      if @subject_topic.update(subject_topic_params)
        format.html { redirect_to @subject_topic, notice: 'Subject topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @subject_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_topics/1
  # DELETE /subject_topics/1.json
  def destroy
    @subject_topic.destroy
    respond_to do |format|
      format.html { redirect_to subject_topics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_topic
      @subject_topic = SubjectTopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_topic_params
      params.require(:subject_topic).permit(:subject_id, :topic_id)
    end
end
