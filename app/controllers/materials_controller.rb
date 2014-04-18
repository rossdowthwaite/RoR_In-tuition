class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]
  before_action :set_topic

  # GET /materials
  def index
    @materials = @topic.materials
    @video = Video.new
    @upload = Upload.new
    @text = Text.new
    @material = Material.new
  end

  # GET /materials/1
  def show
  end

  # GET /materials/new
  def new
    @material = Material.new
  end

  # GET /materials/1/edit
  def edit
  end

  # POST /materials
  def create
    @material = Material.new(material_params)
      if @material.save
        redirect_to :back, notice: 'Material was successfully created.'
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /materials/1
  def update
      if @material.update(material_params)
        redirect_to @material, notice: 'Material was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /materials/1
  def destroy
    @material.destroy
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    def set_topic
      if params[:topic_id]
        @topic = Topic.find(params[:topic_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_params
      params.require(:material).permit(:topic_id, :medium_id, :medium_type)
    end
end
