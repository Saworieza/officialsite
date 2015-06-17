include Warden::Test::Helpers
Warden.test_mode!

# Feature: Member profile page
#   As a member
#   I want to visit my member profile page
#   So I can see my personal account data
feature 'Member profile page', :devise do
	after(:each) do
		Warden.test_reset!
	end

	# Scenario: Member sees own profile
	#   Given I am signed in
	#   When I visit the member profile page
	#   Then I see my own email address
	scenario 'member sees own profile' do
		member = FactoryGirl.create(:member)
		login_as(member, :scope => :member)
		visit member_path(member)
		expect(page).to have_content member.email
	end

	# Scenario: Member cannot see another member's profile
	#   Given I am signed in
	#   When I visit another member's profile
	#   Then I see an 'access denied' message
	scenario "member cannot see another member's profile" do
		skip "to be decided later"
		me = FactoryGirl.create(:member)
		other = FactoryGirl.create(:member, email: 'other@example.com')
		login_as(me, :scope => :member)
		Capybara.current_session.driver.header 'Referer', root_path
		visit member_path(other)
		expect(page).to have_content 'Access denied.'
	end
end
