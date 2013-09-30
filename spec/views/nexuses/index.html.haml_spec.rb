require 'spec_helper'

describe "nexuses/index" do
  before(:each) do
    assign(:nexuses, [
      stub_model(Nexuse),
      stub_model(Nexuse)
    ])
  end

  it "renders a list of nexuses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
