class SchoolCoursesController < ApplicationController
  before_action :set_school_course, only: [:show, :edit, :update, :destroy]

  # POST /school_courses
  def create
    @school_course = SchoolCourse.new(school_course_params)

      if @school_course.save
        redirect_to @school_course, notice: 'School course was successfully created.'
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /school_courses/1
  def update
      if @school_course.update(school_course_params)
        redirect_to @school_course, notice: 'School course was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /school_courses/1
  def destroy
    @school_course.destroy
    format.html { redirect_to school_courses_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_course
      @school_course = SchoolCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_course_params
      params.require(:school_course).permit(:course_id, :school_id)
    end
end
