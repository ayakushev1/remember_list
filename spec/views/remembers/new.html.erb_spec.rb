require 'spec_helper'

describe "remembers/new" do
  before(:each) do
    assign(:remember, stub_model(Remember,
      :name => "MyString",
      :tegs => "MyString",
      :short_desc => "MyText",
      :full_desc => "MyText",
      :ref_name => "MyString",
      :active => false,
      :ref_type => "MyString"
    ).as_new_record)
  end

  it "renders new remember form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", remembers_path, "post" do
      assert_select "input#remember_name[name=?]", "remember[name]"
      assert_select "input#remember_tegs[name=?]", "remember[tegs]"
      assert_select "textarea#remember_short_desc[name=?]", "remember[short_desc]"
      assert_select "textarea#remember_full_desc[name=?]", "remember[full_desc]"
      assert_select "input#remember_ref_name[name=?]", "remember[ref_name]"
      assert_select "input#remember_active[name=?]", "remember[active]"
      assert_select "input#remember_ref_type[name=?]", "remember[ref_type]"
    end
  end
end
