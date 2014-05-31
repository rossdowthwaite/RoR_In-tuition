class Booking < ActiveRecord::Base

  #---------- ASSOCIATIONS ----------------- 

  belongs_to :booker, :class_name => "User", :foreign_key => :booker_id

  has_many :comments, as: :commentable
  has_many :notifications, as: :notifiable, :dependent => :destroy

   # Join table for users and appointments
	has_many :appointments, :dependent => :destroy
	has_many :users, :through => :appointments

  # Join table to add courses to posts
  has_many :course_bookings, :dependent => :destroy
  has_many :courses, :through => :course_bookings

  accepts_nested_attributes_for :appointments, allow_destroy: true
  accepts_nested_attributes_for :course_bookings, allow_destroy: true

  # --------- Hooks -----------------------

  before_update :check_doubles

  #---------- Validations -----------------  


  validates :title, presence: true
  validates :description, presence: true
  validates :start, presence: true
  validates_date :start, :on_or_after => lambda { Date.current }

  validates_date :end, :after => :start, 
                       :after_message => 'end date must be start date',
                       :allow_blank => true

  validates_time :end_time, :after => :start_time, 
                            :after_message => 'end time must be after start time'

  #---------- SCOPES -----------------   

  scope :my_bookings, -> (id) { where(:booker_id => id) }
  scope :next, -> { where('start >= ?', Date.today)}
  scope :previous, -> { where('start < ?', Date.today)}
  scope :after, -> (date) { where('start > ?', date) }


 #---------- AUTHENTICATION ----------------- 

 # this functionality was implemented using the RESTful_ACL gem 
 # and by following this tutorial - http://everydayrails.com/2010/06/16/authorization-restful-acl-1.html 
 # full referencses can be found in the full report reference page - [51][45]
 
  def self.is_indexable_by(user, parent = nil)
    user != nil 
  end

  def self.is_creatable_by(user, parent = nil)
    user != nil
  end

  def is_readable_by(user, parent = nil)
    user.bookings.include?(self)
  end

  def is_updatable_by(user, parent = nil)
    user.bookings.include?(self)
  end

  def is_deletable_by(user, parent = nil)
    user.bookings.include?(self)
  end


  #---------- METHODS -----------------

  # Creates an owner for the booking
  # Creates an appointment useing the current user as owner
  def add_owner(owner)
    @user = User.find(owner)
    @owner = @user
    @app = @user.appointments.create(:booking_id => self.id, :owner => true, :confirmed => true, :status => 'booked')
    if @app.save
      BookingMailer.booking_email(@user, @app.booking, @owner).deliver
    end  
  end

  # Creates an owner for the booking
  # Creates an appointment useing the current user as owner
  def add_student(student, owner)
    @user = User.find(student)
    @owner = User.find(owner)
    @app = @user.appointments.create(:booking_id => eslf.id)
    if @app.save
      BookingMailer.booking_email(@user, @app.booking, @owner).deliver
    end
  end

  def check_doubles
    # Get all the booking appointments and loop through them
    @apps = self.appointments
    @apps.each do |app|

      #get each user and loop through their bookings
      @user = app.user
      @user.bookings.each do |booking|

      if booking.id != self.id

        # check the day
        if self.start == booking.start

          #check the between times
          if self.start_time >= booking.start_time and self.end_time <= booking.end_time

            @status = "DoubleBooked"
            @confirmed = nil
            break
          else #all is fine
            
            # check for other appointments
            if self.appointments.count == 1 || app.owner == true
              @status = ""
              @confirmed = true
            else
              @status = "pending"
              @confirmed = nil
            end
          
          end
        
        #all is fine  
        else

            if self.appointments.count == 1 || app.owner == true
              @status = ""
              @confirmed = true
            else
              @status = "pending"
              @confirmed = nil
            end

        end
      
      end
      end

      #update the appointment
      @app = Appointment.find(app.id)
      @app.update_attribute(:status,@status)
      @app.update_attribute(:confirmed,@confirmed)

    end #end of app loop

  end #end of method

end








