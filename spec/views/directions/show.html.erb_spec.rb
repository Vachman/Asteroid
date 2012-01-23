require 'spec_helper'

describe "directions/show.html.erb" do
  before(:each) do
    @direction = assign(:direction, stub_model(Direction,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
