class CourseContentsController < ApplicationController
  before_action :set_course_content, only: [:show, :edit, :update, :destroy]

  # GET /course_contents
  def index
    @course_contents = CourseContent.all
  end

  # GET /course_contents/1
  def show
  end

  # GET /course_contents/new
  def new
    @course_content = CourseContent.new
  end

  # GET /course_contents/1/edit
  def edit
  end

  # POST /course_contents
  def create
    @course_content = CourseContent.new(course_content_params)

    respond_to do |format|
      if @course_content.save
        format.html { redirect_to @course_content, notice: 'Course content was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @course_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_contents/1
  # PATCH/PUT /course_contents/1.json
  def update
    respond_to do |format|
      if @course_content.update(course_content_params)
        format.html { redirect_to @course_content, notice: 'Course content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_contents/1
  # DELETE /course_contents/1.json
  def destroy
    @course_content.destroy
    respond_to do |format|
      format.html { redirect_to course_contents_url }
      format.json { head :no_content }
    end
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
