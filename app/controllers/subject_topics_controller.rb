class SubjectTopicsController < ApplicationController
  before_action :set_subject_topic, only: [:update, :destroy]

  # POST /subject_topics
  def create
    @subject_topic = SubjectTopic.new(subject_topic_params)

      if @subject_topic.save
        redirect_to @subject_topic, notice: 'Subject topic was successfully created.'
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /subject_topics/1
  def update
      if @subject_topic.update(subject_topic_params)
        redirect_to @subject_topic, notice: 'Subject topic was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /subject_topics/1
  def destroy
    @subject_topic.destroy
    redirect_to subject_topics_url
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
