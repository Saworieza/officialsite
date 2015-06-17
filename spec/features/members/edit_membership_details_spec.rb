include Warden::Test::Helpers
Warden.test_mode!

# Feature: Member edit
#   As a member
#   I want to edit my member profile
#   So I can change my email address
feature 'Member edit', :devise do
	after(:each) do
		Warden.test_reset!
	end

	# Scenario: Member changes email address
	#   Given I am signed in
	#   When I change my email address
	#   Then I see an account updated message
	scenario 'member changes email address' do
		member = FactoryGirl.create(:member)
		login_as(member, :scope => :member)
		visit edit_member_registration_path(member)
		fill_in 'Email', :with => 'newemail@example.com'
		fill_in 'Current password', :with => member.password
		click_button 'Update'
		txts = [I18n.t( 'devise.registrations.updated'), I18n.t( 'devise.registrations.update_needs_confirmation')]
		expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
	end

	# Scenario: Member cannot edit another member's profile
	#   Given I am signed in
	#   When I try to edit another member's profile
	#   Then I see my own 'edit profile' page
	scenario "member cannot cannot edit another member's profile", :me do
		me = FactoryGirl.create(:member)
		other = FactoryGirl.create(:member, email: 'other@example.com')
		login_as(me, :scope => :member)
		visit edit_member_registration_path(other)
		expect(page).to have_content 'Edit Member'
		expect(page).to have_field('Email', with: me.email)
	end
end
