require 'spec_helper'

describe "nexuses/edit" do
  before(:each) do
    @nexuse = assign(:nexuse, stub_model(Nexuse))
  end

  it "renders the edit nexuse form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", nexuse_path(@nexuse), "post" do
    end
  end
end
