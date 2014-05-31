class EnrolmentsController < ApplicationController
  before_action :set_enrolment, only: [:show, :edit, :update, :destroy]
  before_action :set_course

  # GET /enrolments
  def index
    @enrolments = @course.enrolments
    @students = current_user.students.confirmed
  end

  # GET /enrolments/new
  def new
    @enrolment = Enrolment.new
  end


  # POST /enrolments
  def create
    @enrolment = Enrolment.new(enrolment_params)

      if @enrolment.save
        redirect_to @enrolment, notice: 'Enrolment was successfully created.' 
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /enrolments/1
  def update
    respond_to do |format|
      if @enrolment.update(enrolment_params)
        redirect_to @enrolment, notice: 'Enrolment was successfully updated.' 
      else
        render action: 'edit' 
      end
    end
  end

  # DELETE /enrolments/1
  def destroy
    @enrolment.destroy
    redirect_to enrolments_url 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enrolment
      @enrolment = Enrolment.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enrolment_params
      params.require(:enrolment).permit(:student_id, :course_id)
    end
end
