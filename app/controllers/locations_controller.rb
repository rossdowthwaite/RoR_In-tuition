class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :set_addressable

  # GET /locations
  def index
    @locations = @addressable.locations
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  def create
    @location = @addressable.locations.new(location_params)

      if @location.save
        redirect_to [@addressable, :locations], notice: 'Location was successfully created.'
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /locations/1
  def update
      if @location.update(location_params)
        redirect_to [@addressable, :locations], notice: 'Location was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /locations/1
  def destroy
    @location.destroy
    redirect_to :back 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    def set_addressable
      resource, id = request.path.split('/')[1, 2]
      @addressable = resource.singularize.classify.constantize.find(id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:street, :city, :county, :country, :p_code, :addressable_id, :addressable_type)
    end
end
