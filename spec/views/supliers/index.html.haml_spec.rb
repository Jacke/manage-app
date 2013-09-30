require 'spec_helper'

describe "supliers/index" do
  before(:each) do
    assign(:supliers, [
      stub_model(Suplier),
      stub_model(Suplier)
    ])
  end

  it "renders a list of supliers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
