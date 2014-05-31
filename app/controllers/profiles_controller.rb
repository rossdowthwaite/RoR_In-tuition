class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  def create
    @profile = Profile.new(profile_params)

      if @profile.save
        redirect_to @profile, notice: 'Profile was successfully created.'
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /profiles/1
  def update
      if @profile.update(profile_params)
        redirect_to @profile, notice: 'Profile was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy
    redirect_to profiles_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:bio, :profilable_type, :profilable_id)
    end
end
