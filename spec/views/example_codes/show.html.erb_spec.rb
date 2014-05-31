require 'spec_helper'

describe "example_codes/show" do
  before(:each) do
    @example_code = assign(:example_code, stub_model(ExampleCode,
      :example_string => "Example String",
      :example_int => 1,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Example String/)
    rendered.should match(/1/)
    rendered.should match(//)
  end
end
