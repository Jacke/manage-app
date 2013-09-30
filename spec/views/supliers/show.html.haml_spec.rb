require 'spec_helper'

describe "supliers/show" do
  before(:each) do
    @suplier = assign(:suplier, stub_model(Suplier))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
