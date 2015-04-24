require 'rails_helper'

RSpec.describe "members/show", type: :view do
  before(:each) do
    @member = assign(:member, Member.create!(
      :first_name => "First",
      :last_name => "Last",
      :email => "my@email.com",
      :mobile => "Mobile",
      :password => "Mysringpass"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Mobile/)
  end
  xit "has member image" do

    pending("has to confirm the image is of that particular user")
  end
  it "shows basic member attributes" do
    render
    assert_select "p", :text => "Names: First Last".to_s, :count => 1
    assert_select "p", :text => "Email: my@email.com".to_s, :count => 1
    # assert_select "p", :text => "Mobile: Mobile".to_s, :count => 1
    assert_select "p", "Mobile: Mobile".to_s, :count => 1
  end
  xit "has member about me section" do
  end
  xit "has member lakehub portfolio" do
    
  end
  xit "has member personal portfolio" do
    
  end
end
