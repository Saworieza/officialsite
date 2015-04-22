require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "my@email.com",
        :mobile => "Mobile",
        :password => "Mysringpass"
      ),
      Member.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "my1@email.com",
        :mobile => "Mobile",
        :password => "Mysringpass"
      )
    ])
  end

  it "renders a list of members" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    # assert_select "tr>td", :text => "Email".to_s, :count => 2
    # assert_select "tr>td", :text => "Mobile".to_s, :count => 2
  end
end
