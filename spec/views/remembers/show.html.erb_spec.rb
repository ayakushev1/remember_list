require 'spec_helper'

describe "remembers/show" do
  before(:each) do
    @remember = assign(:remember, stub_model(Remember,
      :name => "Name",
      :tegs => "Tegs",
      :short_desc => "MyText",
      :full_desc => "MyText",
      :ref_name => "Ref Name",
      :active => false,
      :ref_type => "Ref Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Tegs/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Ref Name/)
    rendered.should match(/false/)
    rendered.should match(/Ref Type/)
  end
end
