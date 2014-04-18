class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /products
  def index
    @products = @user.products
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    session[:return_to] ||= request.referer
  end

  # GET /products/1/edit
  def edit
    session[:return_to] ||= request.referer
  end

  # POST /products
  def create
    @product = @user.products.new(product_params)
      if @product.save
        redirect_to session.delete(:return_to), notice: 'Product was successfully created.'
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /products/1
  def update
      if @product.update(product_params)
        redirect_to session.delete(:return_to), notice: 'Product was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_user
      @user = current_user    
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:user_id, :title, :description, :price)
    end
end
