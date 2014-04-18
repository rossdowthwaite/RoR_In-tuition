class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /goals
  def index
    @goals = current_user.goals.all
  end

  # GET /goals/1
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  def create
    @goal = current_user.goals.new(goal_params)
      if @goal.save
        redirect_to goals_url , notice: 'Goal was successfully created.'
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /goals/1
  def update
      if @goal.update(goal_params)
        redirect_to goals_url , notice: 'Goal was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /goals/1
  def destroy
    @goal.destroy
    redirect_to goals_url 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:user_id, :aim)
    end
end
