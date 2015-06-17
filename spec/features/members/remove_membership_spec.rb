include Warden::Test::Helpers
Warden.test_mode!

# Feature: Member delete
#   As a member
#   I want to delete my member profile
#   So I can close my account
feature 'Member delete', :devise, :js do
	after(:each) do
		Warden.test_reset!
	end

	# Scenario: Member can delete own account
	#   Given I am signed in
	#   When I delete my account
	#   Then I should see an account deleted message
	scenario 'member can delete own account' do
		#skip 'skip a slow test'
		member = FactoryGirl.create(:member)
		login_as(member, :scope => :member)
		visit edit_member_registration_path(member)
		click_button 'Cancel my account'
		page.driver.browser.switch_to.alert.accept
		expect(page).to have_content I18n.t 'devise.registrations.destroyed'
	end
end
