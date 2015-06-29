require 'rails_helper'

RSpec.describe "members/edit", type: :view do
  before(:each) do
    @member = assign(:member, Member.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "my@email.com",
      :mobile => "MyString",
      :password => "Mysringpass"
      
    ))
  end

  it "renders the edit member form" do
		skip
    render

    assert_select "form[action=?][method=?]", member_path(@member), "post" do

      assert_select "input#member_first_name[name=?]", "member[first_name]"

      assert_select "input#member_last_name[name=?]", "member[last_name]"

      assert_select "input#member_email[name=?]", "member[email]"

      assert_select "input#member_mobile[name=?]", "member[mobile]"
    end
  end
end
