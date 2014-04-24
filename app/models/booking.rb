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

  #---------- Validations -----------------  




  #---------- SCOPES -----------------   

  scope :my_bookings, -> (id) { where(:booker_id => id) }
  scope :next, -> { where('start >= ?', Date.today)}
  scope :previous, -> { where('start < ?', Date.today)}
  scope :after, -> (date) { where('start > ?', date) }


 #---------- AUTHENTICATION ----------------- 

 # This method checks permissions for the :index action
  def self.is_indexable_by(user, parent = nil)
    user != nil
  end

  # This method checks permissions for the :create and :new action
  def self.is_creatable_by(user, parent = nil)
    user != nil
  end

  # This method checks permissions for the :show action
  def is_readable_by(user, parent = nil)
    user.bookings.include?(self)
  end

  # This method checks permissions for the :update and :edit action
  def is_updatable_by(user, parent = nil)
    user.bookings.include?(self)
  end

  # This method checks permissions for the :destroy action
  def is_deletable_by(user, parent = nil)
    user.bookings.include?(self)
  end


  #---------- METHODS -----------------

  def add_recurring_events(params, type, freq, limit, owner, student, course)
  	@frequency = freq.to_i
  	@limit = limit.to_i
  	@limit = @limit-1
    @owner = owner
  	@freq_type = type

  	@date =  Date.strptime(params[:start], '%Y-%m-%d')

  	@start_date = @date

    # loop and create events to the specified amount
  	(0..@limit).each do |i|

  		@booking = Booking.new(params)
  		@booking.start = @start_date.to_s
      @booking.save


      # add an owner to the booking
      if owner != nil
        add_owner(@owner, @booking)
      end

      if student != nil 
        add_student(student, @booking)
      end

      if course != nil 
        add_course(course, @booking)
      end

      # check the duration at which the event should be reccured
  		case @freq_type 
	  		when "weeks"
	  			@start_date = @start_date + @frequency.weeks
	  		when "months"
	  			@start_date = @start_date + @frequency.months
	  		when "years"
	  			@start_date = @start_date + @frequency.years
  		end

  	end
  end

  # Creates an owner for the booking
  # Creates an appointment useing the current user as owner
  def add_owner(owner, booking)
    @user = User.find(owner)
    @user.appointments.create(:booking_id => booking.id, :owner => true, :confirmed => true, :status => 'booked')
  end

  # Creates an owner for the booking
  # Creates an appointment useing the current user as owner
  def add_student(student, booking)
    @user = User.find(student)
    @user.appointments.create(:booking_id => booking.id)
  end

  # Creates an owner for the booking
  # Creates an appointment useing the current user as owner
  def add_course(course, booking)
    @course = Course.find(course)
    @course.bookings << booking
  end
end
