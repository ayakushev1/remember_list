require 'spec_helper'

describe "remembers/index" do
  before(:each) do
    assign(:remembers, [
      stub_model(Remember,
        :name => "Name",
        :tegs => "Tegs",
        :short_desc => "MyText",
        :full_desc => "MyText",
        :ref_name => "Ref Name",
        :active => false,
        :ref_type => "Ref Type"
      ),
      stub_model(Remember,
        :name => "Name",
        :tegs => "Tegs",
        :short_desc => "MyText",
        :full_desc => "MyText",
        :ref_name => "Ref Name",
        :active => false,
        :ref_type => "Ref Type"
      )
    ])
  end

  it "renders a list of remembers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Tegs".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Ref Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Ref Type".to_s, :count => 2
  end
end
