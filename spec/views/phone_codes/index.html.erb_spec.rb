require 'spec_helper'

describe "phone_codes/index.html.erb" do
  before(:each) do
    assign(:phone_codes, [
      stub_model(PhoneCode,
        :coe => "Coe",
        :region_id => 1
      ),
      stub_model(PhoneCode,
        :coe => "Coe",
        :region_id => 1
      )
    ])
  end

  it "renders a list of phone_codes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Coe".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
