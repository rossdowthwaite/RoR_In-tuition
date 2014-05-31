require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ExampleCodesController do

  # This should return the minimal set of attributes required to create a valid
  # ExampleCode. As you add validations to ExampleCode, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "example_string" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ExampleCodesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all example_codes as @example_codes" do
      example_code = ExampleCode.create! valid_attributes
      get :index, {}, valid_session
      assigns(:example_codes).should eq([example_code])
    end
  end

  describe "GET show" do
    it "assigns the requested example_code as @example_code" do
      example_code = ExampleCode.create! valid_attributes
      get :show, {:id => example_code.to_param}, valid_session
      assigns(:example_code).should eq(example_code)
    end
  end

  describe "GET new" do
    it "assigns a new example_code as @example_code" do
      get :new, {}, valid_session
      assigns(:example_code).should be_a_new(ExampleCode)
    end
  end

  describe "GET edit" do
    it "assigns the requested example_code as @example_code" do
      example_code = ExampleCode.create! valid_attributes
      get :edit, {:id => example_code.to_param}, valid_session
      assigns(:example_code).should eq(example_code)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ExampleCode" do
        expect {
          post :create, {:example_code => valid_attributes}, valid_session
        }.to change(ExampleCode, :count).by(1)
      end

      it "assigns a newly created example_code as @example_code" do
        post :create, {:example_code => valid_attributes}, valid_session
        assigns(:example_code).should be_a(ExampleCode)
        assigns(:example_code).should be_persisted
      end

      it "redirects to the created example_code" do
        post :create, {:example_code => valid_attributes}, valid_session
        response.should redirect_to(ExampleCode.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved example_code as @example_code" do
        # Trigger the behavior that occurs when invalid params are submitted
        ExampleCode.any_instance.stub(:save).and_return(false)
        post :create, {:example_code => { "example_string" => "invalid value" }}, valid_session
        assigns(:example_code).should be_a_new(ExampleCode)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ExampleCode.any_instance.stub(:save).and_return(false)
        post :create, {:example_code => { "example_string" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested example_code" do
        example_code = ExampleCode.create! valid_attributes
        # Assuming there are no other example_codes in the database, this
        # specifies that the ExampleCode created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ExampleCode.any_instance.should_receive(:update).with({ "example_string" => "MyString" })
        put :update, {:id => example_code.to_param, :example_code => { "example_string" => "MyString" }}, valid_session
      end

      it "assigns the requested example_code as @example_code" do
        example_code = ExampleCode.create! valid_attributes
        put :update, {:id => example_code.to_param, :example_code => valid_attributes}, valid_session
        assigns(:example_code).should eq(example_code)
      end

      it "redirects to the example_code" do
        example_code = ExampleCode.create! valid_attributes
        put :update, {:id => example_code.to_param, :example_code => valid_attributes}, valid_session
        response.should redirect_to(example_code)
      end
    end

    describe "with invalid params" do
      it "assigns the example_code as @example_code" do
        example_code = ExampleCode.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ExampleCode.any_instance.stub(:save).and_return(false)
        put :update, {:id => example_code.to_param, :example_code => { "example_string" => "invalid value" }}, valid_session
        assigns(:example_code).should eq(example_code)
      end

      it "re-renders the 'edit' template" do
        example_code = ExampleCode.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ExampleCode.any_instance.stub(:save).and_return(false)
        put :update, {:id => example_code.to_param, :example_code => { "example_string" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested example_code" do
      example_code = ExampleCode.create! valid_attributes
      expect {
        delete :destroy, {:id => example_code.to_param}, valid_session
      }.to change(ExampleCode, :count).by(-1)
    end

    it "redirects to the example_codes list" do
      example_code = ExampleCode.create! valid_attributes
      delete :destroy, {:id => example_code.to_param}, valid_session
      response.should redirect_to(example_codes_url)
    end
  end

end
