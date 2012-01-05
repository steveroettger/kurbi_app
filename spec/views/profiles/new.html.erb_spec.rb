require 'spec_helper'

describe "profiles/new.html.erb" do
  before(:each) do
    assign(:profile, stub_model(Profile,
      :location => "MyString",
      :bio => "MyText",
      :diagnosed => "MyString",
      :medications => "MyText"
    ).as_new_record)
  end

  it "renders new profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => profiles_path, :method => "post" do
      assert_select "input#profile_location", :name => "profile[location]"
      assert_select "textarea#profile_bio", :name => "profile[bio]"
      assert_select "input#profile_diagnosed", :name => "profile[diagnosed]"
      assert_select "textarea#profile_medications", :name => "profile[medications]"
    end
  end
end
