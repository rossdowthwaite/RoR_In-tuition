class QualificationsController < ApplicationController
  before_action :set_qualification, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /qualifications
  def index
    @qualifications = current_user.qualifications.all
  end


  # GET /qualifications/new
  def new
    @qualification = Qualification.new
  end

  # GET /qualifications/1/edit
  def edit
  end

  # POST /qualifications
  def create
    @qualification = current_user.qualifications.new(qualification_params)
      if @qualification.save
        redirect_to qualifications_url, notice: 'Qualification was successfully created.' 
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /qualifications/1
  def update
      if @qualification.update(qualification_params)
        redirect_to qualifications_url, notice: 'Qualification was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /qualifications/1
  def destroy
    @qualification.destroy
    redirect_to qualifications_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qualification
      @qualification = Qualification.find(params[:id])
    end

    def set_user
      @user = current_user
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def qualification_params
      params.require(:qualification).permit(:user_id, :quality)
    end
end
