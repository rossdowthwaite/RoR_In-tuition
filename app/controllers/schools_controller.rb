class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy, :add_course, :course_update]
  before_action :set_user

  # GET /schools
  def index
    @schools = @user.schools
  end

  # GET /schools/1
  def show
    @courses = @school.courses
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  def create
    @school = @user.schools.new(school_params)

      if @school.save
        redirect_to @school, notice: 'School was successfully created.'
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /schools/1
  def update
      if @school.update(school_params)
        redirect_to @school, notice: 'School was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /schools/1
  def destroy
    @school.destroy
    redirect_to schools_url
  end

  def course_update
      if @school.update(school_params)
        redirect_to school_path(@school), notice: 'Course was successfully updated.'
      else
        ender action: 'edit'
      end
  end

  def add_course
    @courses = current_user.courses
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:title, :description, :logo, :user_id, :course_ids => [])
    end
end
