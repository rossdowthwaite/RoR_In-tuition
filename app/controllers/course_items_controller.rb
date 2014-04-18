class CourseItemsController < ApplicationController
  before_action :set_course_item, only: [:show, :edit, :update, :destroy]
  before_action :set_course

  # GET /course_items
  def index
    @course_items = @course.course_items
  end

  # GET /course_items/1
  def show
  end

  # GET /course_items/new
  def new
    @course_item = CourseItem.new
  end

  # GET /course_items/1/edit
  def edit
  end

  # POST /course_items
  def create
    @course_item = CourseItem.new(course_item_params)

      if @course_item.save
        redirect_to @course_item, notice: 'Course item was successfully created.'
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /course_items/1
  def update
      if @course_item.update(course_item_params)
        redirect_to course_course_items_path(@course), notice: 'Course item was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /course_items/1
  def destroy
    @course_item.destroy
    redirect_to course_items_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_item
      @course_item = CourseItem.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def course_item_params
      params.require(:course_item).permit(:product_id, :course_id, :show_in_profile)
    end
end
