class BookingsController < ApplicationController
  before_filter :has_permission? 
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_students, only: [:new, :create]

  include BookingsHelper

  # GET /bookings
  def index
    @bookings = current_user.bookings.next.order("start asc")
    @old_bookings = current_user.bookings.previous.order("start asc")
    @appointments =  current_user.appointments
  end

  def old
    @old_bookings = current_user.bookings.previous.order("start asc")
  end

  # GET /bookings/1
  def show
    @appointments = @booking.appointments
    @my_appointment = @booking.appointments.my_appointment(current_user.id).first
    @comments = @booking.comments
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
    @courses = current_user.courses
    @students = current_user.students.pluck(:pupil_id)
    @students = User.find(@students, current_user.id)

    @appointments = @booking.appointments
    @my_appointment = @booking.appointments.my_appointment(current_user.id).first
  end

  def multiple_delete
    Booking.destroy(params[:bookings])
    redirect_to bookings_path
  end

  # POST /bookings
  def create
    @freq = params[:recurring_amount].to_i
    @type = params[:recurring_type]
    @limit = params[:recurring_for].to_i 
    @owner = params[:owner]
    @student = params[:student]

    @booking =  Booking.new(booking_params)
    @start_date =  @booking.start

    (1..@limit).each do |i|

      @booking =  Booking.new(booking_params)
      @booking.start = @start_date

      if @booking.save 
          # add an owner to the booking
          if @owner != nil
            @booking.add_owner(@owner)
          end
          
          # add student to the booking
          if @student != nil 
            @booking.add_student(@student, @owner)
          end
          #add the date up
          case @type 
            when "weeks"
              @start_date = @booking.start + i.weeks
            when "months"
              @start_date = @booking.start + i.months
            when "years"
              @start_date = @booking.start + i.years
          end
      else
        render action: 'new' and return
      end
    end
    if @limit == 1
      redirect_to @booking
    else
      redirect_to bookings_path
    end
  end

  # PATCH/PUT /bookings/1
  def update
      if @booking.update(booking_params)
        redirect_to @booking, notice: 'Booking was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
    redirect_to bookings_url
  end

  def group_delete
    Booking.destroy(params[:bookings])
    redirect_to bookings_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def set_students
      @students = current_user.students.confirmed
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:title, :description, :booker_id, :start, :end, :start_time, :end_time, :course_bookings_attributes => [:id, :course_id, :_destroy], :appointments_attributes => [:id, :user_id, :_destroy])
    end
end
