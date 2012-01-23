require 'spec_helper'

describe "directions/edit.html.erb" do
  before(:each) do
    @direction = assign(:direction, stub_model(Direction,
      :name => "MyString"
    ))
  end

  it "renders the edit direction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => directions_path(@direction), :method => "post" do
      assert_select "input#direction_name", :name => "direction[name]"
    end
  end
end
