class EnrolmentsController < ApplicationController
  before_action :set_enrolment, only: [:show, :edit, :update, :destroy]
  before_action :set_course

  # GET /enrolments
  # GET /enrolments.json
  def index
    @enrolments = @course.enrolments
    @students = current_user.students
    # ADD WHERE STATUS = Accepted
  end

  # GET /enrolments/1
  # GET /enrolments/1.json
  def show
  end

  # GET /enrolments/new
  def new
    @enrolment = Enrolment.new
  end

  # GET /enrolments/1/edit
  def edit
  end

  # POST /enrolments
  # POST /enrolments.json
  def create
    @enrolment = Enrolment.new(enrolment_params)

    respond_to do |format|
      if @enrolment.save
        format.html { redirect_to @enrolment, notice: 'Enrolment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @enrolment }
      else
        format.html { render action: 'new' }
        format.json { render json: @enrolment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enrolments/1
  # PATCH/PUT /enrolments/1.json
  def update
    respond_to do |format|
      if @enrolment.update(enrolment_params)
        format.html { redirect_to @enrolment, notice: 'Enrolment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @enrolment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enrolments/1
  # DELETE /enrolments/1.json
  def destroy
    @enrolment.destroy
    respond_to do |format|
      format.html { redirect_to enrolments_url }
      format.json { head :no_content }
    end
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
