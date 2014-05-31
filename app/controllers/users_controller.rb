class UsersController < ApplicationController
  before_filter :has_permission?
  before_action :set_user, only: [:show, :edit, :update, :destroy, :avatar, :my_materials]


  def show
    # To get all the user posts and relating posts from the forums they are contribitors for
    @user_forums = ForumContributor.contributor(current_user.id).pluck(:forum_id)
    @forum_posts = ForumPost.from_forums(@user_forums).pluck(:post_id)
    @posts = Post.find(@forum_posts)
    @posts = @posts.sort_by{|e| e[:created_at]}
    @posts = @posts.reverse 

    @appointments = @user.appointments
    @bookings = current_user.bookings.next.order("start asc")
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.is_admin == true

      if @user.save_without_session_maintenance

        redirect_to users_admin_index_path

      else

        render action: 'admin'
     
      end
    
    else

      if @user.save

        UserMailer.welcome_email(@user).deliver
        redirect_to @user, notice: 'User was successfully created.'
      
      else
    
        render action: 'new'
      
      end

    end
  end

  def update
      if @user.update(user_params)
        redirect_to :back, notice: 'User was successfully updated.'
      else
        render action: 'edit' 
      end
  end

  def destroy
    @user.destroy
    redirect_to users_url 
  end

  # Extra Views
  def avatar 
  end

  def admin
    @admin_user = User.new
  end

  def my_materials
    @topics = @user.topics
    @subjects = @user.subjects
    @materials = @topics.count + @subjects.count
  end

  def my_office
  end

  def profile
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:title, :username, :password, :password_confirmation, :email, :dob, :avatar, :is_admin)
    end
end
