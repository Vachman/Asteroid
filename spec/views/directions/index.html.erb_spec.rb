require 'spec_helper'

describe "directions/index.html.erb" do
  before(:each) do
    assign(:directions, [
      stub_model(Direction,
        :name => "Name"
      ),
      stub_model(Direction,
        :name => "Name"
      )
    ])
  end

  it "renders a list of directions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
