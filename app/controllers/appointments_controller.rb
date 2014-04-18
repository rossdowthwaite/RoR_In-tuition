class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :set_booking, only: [:show]

  # GET /appointments
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  def show
    @owner = @booking.appointments.where(:owner => true).first
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  def create
    @appointment = Appointment.new(appointment_params)
      if @appointment.save
        redirect_to @appointment, notice: 'Appointment was successfully created.'
      else
        render action: 'new' 
      end
  end

  # PATCH/PUT /appointments/1
  def update
      if @appointment.update(appointment_params)
        redirect_to :back, notice: 'Appointment was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /appointments/1
  def destroy
    @appointment.destroy
    redirect_to appointments_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end


    def set_booking
      @booking = Booking.find(@appointment.booking_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:user_id, :booking_id, :owner, :confirmed, :status)
    end
end
