class ExampleCodesController < ApplicationController
  before_action :set_example_code, only: [:show, :edit, :update, :destroy]

  # GET /example_codes
  # GET /example_codes.json
  def index
    @example_codes = ExampleCode.all
  end

  # GET /example_codes/1
  # GET /example_codes/1.json
  def show
  end

  # GET /example_codes/new
  def new
    @example_code = ExampleCode.new
  end

  # GET /example_codes/1/edit
  def edit
  end

  # POST /example_codes
  # POST /example_codes.json
  def create
    @example_code = ExampleCode.new(example_code_params)

    respond_to do |format|
      if @example_code.save
        format.html { redirect_to @example_code, notice: 'Example code was successfully created.' }
        format.json { render action: 'show', status: :created, location: @example_code }
      else
        format.html { render action: 'new' }
        format.json { render json: @example_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /example_codes/1
  # PATCH/PUT /example_codes/1.json
  def update
    respond_to do |format|
      if @example_code.update(example_code_params)
        format.html { redirect_to @example_code, notice: 'Example code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @example_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /example_codes/1
  # DELETE /example_codes/1.json
  def destroy
    @example_code.destroy
    respond_to do |format|
      format.html { redirect_to example_codes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_example_code
      @example_code = ExampleCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def example_code_params
      params.require(:example_code).permit(:example_string, :example_int, :user_id)
    end
end
