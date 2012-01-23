require 'spec_helper'

describe "directions/new.html.erb" do
  before(:each) do
    assign(:direction, stub_model(Direction,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new direction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => directions_path, :method => "post" do
      assert_select "input#direction_name", :name => "direction[name]"
    end
  end
end
