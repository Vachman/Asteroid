require 'spec_helper'

describe "phone_codes/new.html.erb" do
  before(:each) do
    assign(:phone_code, stub_model(PhoneCode,
      :coe => "MyString",
      :region_id => 1
    ).as_new_record)
  end

  it "renders new phone_code form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => phone_codes_path, :method => "post" do
      assert_select "input#phone_code_coe", :name => "phone_code[coe]"
      assert_select "input#phone_code_region_id", :name => "phone_code[region_id]"
    end
  end
end
