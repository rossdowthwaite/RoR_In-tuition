class BookingsController < ApplicationController
  before_filter :has_permission?
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

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
    @students = current_user.students.confirmed
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
    @freq = params[:recurring_amount]
    @type = params[:recurring_type]
    @limit = params[:recurring_for]
    @owner = params[:owner]
    @student = params[:student]

    @booking = Booking.new
    @booking.add_recurring_events(booking_params, @type, @freq, @limit, @owner, @student, @course)
    redirect_to @booking
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:title, :description, :booker_id, :start, :end, :start_time, :end_time, :course_bookings_attributes => [:id, :course_id, :_destroy], :appointments_attributes => [:id, :user_id, :_destroy])
    end
end
