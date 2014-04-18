class UserSessionsController < ApplicationController
  before_action :set_user_session, only: [:destroy]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params)

      if @user_session.save
        redirect_to user_path(current_user), notice: 'Logged In'
      else
        render action: 'new' 
      end
  end

  def destroy
    @user_session.destroy
    redirect_to root_path, notice: 'Logged Out'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_session
      @user_session = UserSession.find
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_session_params
      params.require(:user_session).permit(:password, :username)
    end
end
