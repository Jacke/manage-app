require 'spec_helper'

describe "supliers/new" do
  before(:each) do
    assign(:suplier, stub_model(Suplier).as_new_record)
  end

  it "renders new suplier form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", supliers_path, "post" do
    end
  end
end
