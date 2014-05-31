class PublicsController < ApplicationController

  def introduction
  	# if logged in go to the user dashboard
    if current_user
      user_dash
    end
  end

  # Search and Geocoder functionality was implemented following a Ryan Bates screencast tutorial
  # found at http://railscasts.com/episodes/370-ransack 
  # and - http://railscasts.com/episodes/273-geocoder
  # and - http://railscasts.com/episodes/240-search-sort-paginate-with-ajax?autoplay=true.
  # and - http://railscasts.com/episodes/37-simple-search-form?autoplay=true. 
  # full reference at [63],[64],[66] & [67]
  def search
    if params[:near].present?
      @search = Location.joins(:course).near(params[:near]).search(params[:q])
      @courses = @search.result
    else
      @search = Location.joins(:course).search(params[:q])
      @courses = @search.result
    end
  end

  def denied_action
  end

protected
  def user_dash
    redirect_to current_user
  end
end
