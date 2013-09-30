require 'spec_helper'

describe "supliers/edit" do
  before(:each) do
    @suplier = assign(:suplier, stub_model(Suplier))
  end

  it "renders the edit suplier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", suplier_path(@suplier), "post" do
    end
  end
end
