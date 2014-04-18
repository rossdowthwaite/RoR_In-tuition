class Appointment < ActiveRecord::Base
  belongs_to :user
  belongs_to :booking

  has_many :notifications, as: :notifiable, :dependent => :destroy

  scope :for_booking, ->(id) { where(:booking_id => id) }
  scope :is_confirmed, -> { where(:confirmed => true) }
  scope :owner, -> {where(:owner => true)}
  scope :my_appointment, ->(id) { where(:user_id => id)}
  scope :rejected, -> { where(:confirmed => false)}
  scope :pending, -> { where(:confirmed => nil)}
  scope :not_owner, -> { where(:owner => nil)}

  after_create :send_notification

  def send_notification
  	if self.confirmed == nil
	    @notifiable = self
	    @booking = Booking.find(self.booking_id)
	    @appointments = Appointment.owner.for_booking(self.booking.id).first
	    @receiver = User.find(self.user_id)
	    @notifiable.notifications.create(:user => @booking.booker, :receiver_id => @receiver.id, :message => 'New Booking !!')
	 end
  end

  def get_booking_owner(appointment, booking)

  end

end
