require 'spec_helper'

describe "example_codes/index" do
  before(:each) do
    assign(:example_codes, [
      stub_model(ExampleCode,
        :example_string => "Example String",
        :example_int => 1,
        :user => nil
      ),
      stub_model(ExampleCode,
        :example_string => "Example String",
        :example_int => 1,
        :user => nil
      )
    ])
  end

  it "renders a list of example_codes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Example String".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
