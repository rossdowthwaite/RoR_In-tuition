class StudentsController < ApplicationController
  before_filter :has_permission?
  before_action :set_student, only: [:show, :edit, :update, :destroy, :enrol_on_course, :book_a_lesson]
  before_action :set_forum, only: [:show]
  before_action :set_pupil, only: [:show, :edit, :update, :destroy, :enrol_on_course, :book_a_lesson]

  # GET /students
  def index
    @students = current_user.students
  end

  # GET /students/1
  def show
    @courses = @student.courses
    @posts = @forum.posts.order("created_at desc")
    @post = Post.new

    # get the ids of the current users bookings 
    @booking_ids = current_user.bookings.pluck(:id)
    # match them with the students bookings
    @bookings = @pupil.bookings.where(:id => @booking_ids).next.pluck(:id)
    #find the appointments that are confirmed
    @appointments = @pupil.appointments.for_booking(@bookings).is_confirmed

    @old_bookings = @pupil.bookings.where(:id => @booking_ids).previous.pluck(:id)
    @old_appointments = @pupil.appointments.for_booking(@old_bookings).is_confirmed

  end

  # GET /students/new
  def new
    @student = Student.new
    @search = User.search(params[:q])
    if !params[:q].nil?
      if !params[:q].empty?
          @done = params[:q]
          @users = @search.result
      else
          @done = "set"
          @users = []
      end
    else
      @users = []
    end
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  def create
    @student = Student.new(student_params)
      if @student.save
        redirect_to students_path
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /students/1
  def update
      if @student.update(student_params)
        redirect_to session.delete(:return_to)
      else
        redirect_to session.delete(:return_to)
      end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    redirect_to students_url 
  end

  def enrol_on_course
    @enrolment = Enrolment.new
    @courses = current_user.courses
    session[:return_to] ||= request.referer
  end

  def book_a_lesson
    @booking = Booking.new
    @courses = @student.courses  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    def set_forum
      @forum = Forum.is_for('Student').with_id(@student.id).first
    end

    def set_pupil
      @pupil = @student.pupil
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:user_id, :pupil_id, :status, :response, :course_ids => [], :course_bookings_attributes => [:id, :course_id])
    end
end
