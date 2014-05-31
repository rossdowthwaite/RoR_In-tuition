class CourseContentsController < ApplicationController
  before_action :set_course_content, only: [:show, :edit, :update, :destroy]


  # POST /course_contents
  def create
    @course_content = CourseContent.new(course_content_params)

      if @course_content.save
        redirect_to @course_content, notice: 'Course content was successfully created.'
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /course_contents/1
  def update
      if @course_content.update(course_content_params)
        redirect_to @course_content, notice: 'Course content was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /course_contents/1
  def destroy
    @course_content.destroy
    redirect_to course_contents_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_content
      @course_content = CourseContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_content_params
      params.require(:course_content).permit(:subject_id, :course_id)
    end
end
