require 'spec_helper'

describe "nexuses/new" do
  before(:each) do
    assign(:nexuse, stub_model(Nexuse).as_new_record)
  end

  it "renders new nexuse form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", nexuses_path, "post" do
    end
  end
end
