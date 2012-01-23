require 'spec_helper'

describe "phone_codes/show.html.erb" do
  before(:each) do
    @phone_code = assign(:phone_code, stub_model(PhoneCode,
      :coe => "Coe",
      :region_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Coe/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
