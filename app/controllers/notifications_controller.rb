class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :destroy]
  before_action :set_user

  # GET /notifications
  def index
    @notifications = Notification.my_notifications(current_user.id).order("created_at desc")
  end

  # GET /notifications/1
  def show
    @notification.update_attributes(:seen_at => Time.now)
    session[:return_to] ||= request.referer
  end



  # POST /notifications
  def create
    @notification = Notification.new(notification_params)

      if @notification.save
        redirect_to @notification, notice: 'Notification was successfully created.'
      else
        render action: 'new'
      end
  end

  def group_show
  end

  def group_delete
    Notification.destroy(params[:notifications])
    redirect_to notifications_path
  end

  # DELETE /notifications/1
  def destroy
    @notification.destroy
    redirect_to notifications_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notification_params
      params.require(:notification).permit(:user_id, :receiver, :notifiable_type, :notifiable_id, :message)
    end
end