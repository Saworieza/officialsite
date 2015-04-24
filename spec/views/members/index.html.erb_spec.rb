require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        :first_name => "First",
        :last_name => "Last",
        :email => "my@email.com",
        :mobile => "Mobile",
        :password => "Mysringpass"
      ),
      Member.create!(
        :first_name => "First",
        :last_name => "Last",
        :email => "my1@email.com",
        :mobile => "Mobile",
        :password => "Mysringpass"
      )
    ])
  end

  it "renders a list of members" do
    render
    assert_select "h1", :text => "LakeHub Members".to_s, :count => 1
    assert_select ".panel>h6", :text => "Name: First  Last".to_s, :count => 2
    assert_select ".button", :text => "Detailed Profile".to_s, :count => 2
    # assert_select "tr>td", :text => "Email".to_s, :count => 2
    # assert_select "tr>td", :text => "Mobile".to_s, :count => 2
  end
end
