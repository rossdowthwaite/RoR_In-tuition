class SchoolCoursesController < ApplicationController
  before_action :set_school_course, only: [:show, :edit, :update, :destroy]

  # GET /school_courses
  # GET /school_courses.json
  def index
    @school_courses = SchoolCourse.all
  end

  # GET /school_courses/1
  # GET /school_courses/1.json
  def show
  end

  # GET /school_courses/new
  def new
    @school_course = SchoolCourse.new
  end

  # GET /school_courses/1/edit
  def edit
  end

  # POST /school_courses
  # POST /school_courses.json
  def create
    @school_course = SchoolCourse.new(school_course_params)

    respond_to do |format|
      if @school_course.save
        format.html { redirect_to @school_course, notice: 'School course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @school_course }
      else
        format.html { render action: 'new' }
        format.json { render json: @school_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /school_courses/1
  # PATCH/PUT /school_courses/1.json
  def update
    respond_to do |format|
      if @school_course.update(school_course_params)
        format.html { redirect_to @school_course, notice: 'School course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @school_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /school_courses/1
  # DELETE /school_courses/1.json
  def destroy
    @school_course.destroy
    respond_to do |format|
      format.html { redirect_to school_courses_url }
      format.json { head :no_content }
    end
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
