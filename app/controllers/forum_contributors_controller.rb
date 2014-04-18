class ForumContributorsController < ApplicationController
  before_action :set_forum_contributor, only: [:show, :edit, :update, :destroy]

  # GET /forum_contributors
  # GET /forum_contributors.json
  def index
    @forum_contributors = ForumContributor.all
  end

  # GET /forum_contributors/1
  # GET /forum_contributors/1.json
  def show
  end

  # GET /forum_contributors/new
  def new
    @forum_contributor = ForumContributor.new
  end

  # GET /forum_contributors/1/edit
  def edit
  end

  # POST /forum_contributors
  # POST /forum_contributors.json
  def create
    @forum_contributor = ForumContributor.new(forum_contributor_params)

    respond_to do |format|
      if @forum_contributor.save
        format.html { redirect_to @forum_contributor, notice: 'Forum contributor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @forum_contributor }
      else
        format.html { render action: 'new' }
        format.json { render json: @forum_contributor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forum_contributors/1
  # PATCH/PUT /forum_contributors/1.json
  def update
    respond_to do |format|
      if @forum_contributor.update(forum_contributor_params)
        format.html { redirect_to @forum_contributor, notice: 'Forum contributor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @forum_contributor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forum_contributors/1
  # DELETE /forum_contributors/1.json
  def destroy
    @forum_contributor.destroy
    respond_to do |format|
      format.html { redirect_to forum_contributors_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_contributor
      @forum_contributor = ForumContributor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_contributor_params
      params.require(:forum_contributor).permit(:user_id, :forum_id)
    end
end
