class ForumContributorsController < ApplicationController
  before_action :set_forum_contributor, only: [:show, :edit, :update, :destroy]

  # POST /forum_contributors
  def create
    @forum_contributor = ForumContributor.new(forum_contributor_params)

      if @forum_contributor.save
        redirect_to @forum_contributor, notice: 'Forum contributor was successfully created.'
      else
        render action: 'new' 
      end
  end

  # PATCH/PUT /forum_contributors/1
  def update
      if @forum_contributor.update(forum_contributor_params)
        redirect_to @forum_contributor, notice: 'Forum contributor was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /forum_contributors/1
  def destroy
    @forum_contributor.destroy
    redirect_to forum_contributors_url
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
