class PublicsController < ApplicationController

  def introduction
  	# if logged in go to the user dashboard
    if current_user
      user_dash
    end
  end

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
