class ForumPostsController < ApplicationController
  before_action :set_forum_post, only: [:show, :edit, :update, :destroy]
  before_action :set_forum

  # POST /forum_posts
  def create
    @forum_post = ForumPost.new(forum_post_params)

      if @forum_post.save
        redirect_to @forum_post, notice: 'Forum post was successfully created.'
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /forum_posts/1
  def update
      if @forum_post.update(forum_post_params)
        redirect_to @forum_post, notice: 'Forum post was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /forum_posts/1
  def destroy
    @forum_post.destroy
    redirect_to forum_posts_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_post
      @forum_post = ForumPost.find(params[:id])
    end

    def set_forum
      @forum = Forum.find(params[:forum_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_post_params
      params.require(:forum_post).permit(:forum_id, :post_id)
    end
end
