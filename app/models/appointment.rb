class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :booking

  has_many :notifications, as: :notifiable, :dependent => :destroy

  #---------- SCOPES -----------------   

  scope :for_booking, ->(id) { where(:booking_id => id) }
  scope :is_confirmed, -> { where(:confirmed => true) }
  scope :owner, -> {where(:owner => true)}
  scope :my_appointment, ->(id) { where(:user_id => id)}
  scope :rejected, -> { where(:confirmed => false)}
  scope :pending, -> { where(:confirmed => nil)}
  scope :not_owner, -> { where(:owner => nil)}
  scope :double_booked, -> { where(:status => "DoubleBooked")}

  #---------- Validation Hooks -----------------  

  after_create :send_notification
  after_create :is_not_double_booked_that_day


  def send_notification
  	if self.confirmed == nil
	    @notifiable = self
	    @booking = Booking.find(self.booking_id)
	    @appointments = Appointment.owner.for_booking(self.booking.id).first
	    @receiver = User.find(self.user_id)
	    @notifiable.notifications.create(:user => @booking.booker, :receiver_id => @receiver.id, :message => 'New Booking !!')
	 end
  end

  def is_not_double_booked_that_day
      @user = self.user
      @bookings = @user.bookings.where('bookings.id <> ?', self.booking_id )
      @bookings.each do |booking|
        if booking.start == self.booking.start
          if booking.start_time >= self.booking.start_time and booking.end_time <= self.booking.end_time
            self.update_attributes(:status => "DoubleBooked", :confirmed => nil)
          end
        end
      end
  end

end
