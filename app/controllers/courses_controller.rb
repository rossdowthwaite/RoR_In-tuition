class CoursesController < ApplicationController
  
  before_action :set_course, only: [:show, :edit, :update, :destroy, :settings, :enrol_students, :enrolment_update, :edit_enrolments, :book_a_lesson, :new_booking, :content, :add_content, :prices, :update_prices]
  before_action :set_user
  before_filter :has_permission?
  before_action :set_forum, only: [:show]
  before_action :set_profile, except: [:index, :new, :create, :book_a_lesson, :content, :add_content]

  def index
    @courses = @user.courses
    @enrolled = Enrolment.find(:all, :include => :student, :conditions => ["students.pupil_id = ?", current_user.id])
  end

  def show
    @posts = @forum.posts.order("created_at desc")
    @post = Post.new
    @content = @course.subjects
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = @user.courses.new(course_params)
      if @course.save
        redirect_to @course, notice: 'Course was successfully created.' 
      else
        render action: 'new' 
      end
  end

  def update
      if @course.update(course_params)
        redirect_to session.delete(:return_to), notice: 'Course was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def enrolment_update
      if @course.update(course_params)
        redirect_to course_enrolments_path(@course), notice: 'Course Enrolments were successfully updated.'
      else
        render action: 'edit' 
      end
  end

  def destroy
    @course.destroy
    redirect_to courses_url 
  end

  def settings
    session[:return_to] ||= request.referer
  end

  def edit_enrolments
    @students = current_user.students.confirmed
  end

  def book_a_lesson
    @bookings = @course.bookings
  end

  def new_booking
    @booking = Booking.new
    @students = current_user.students
  end

  def add_content
    @content = current_user.subjects
    session.delete(:return_to)
    session[:return_to] ||= request.referer
  end

  def content
    @content = @course.subjects
  end

  def prices
    @prices = @course.products
  end

  def update_prices 
    @products = current_user.products
    session.delete(:return_to)
    session[:return_to] ||= request.referer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      if params[:id]
        @course = Course.find(params[:id])
      else
        @course = Course.find(params[:course_id])
      end  
    end

    def set_user
      @user = current_user
    end

    def set_forum
      @forum = Forum.is_for('Course').with_id(@course.id).first
    end

    def set_profile
      @profile = @course.profile
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :description, :logo, :active, :search_tags, :student_ids => [], :subject_ids => [], :product_ids => [])
    end
end
