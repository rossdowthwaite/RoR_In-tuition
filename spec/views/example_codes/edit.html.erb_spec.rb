require 'spec_helper'

describe "example_codes/edit" do
  before(:each) do
    @example_code = assign(:example_code, stub_model(ExampleCode,
      :example_string => "MyString",
      :example_int => 1,
      :user => nil
    ))
  end

  it "renders the edit example_code form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", example_code_path(@example_code), "post" do
      assert_select "input#example_code_example_string[name=?]", "example_code[example_string]"
      assert_select "input#example_code_example_int[name=?]", "example_code[example_int]"
      assert_select "input#example_code_user[name=?]", "example_code[user]"
    end
  end
end
