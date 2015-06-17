include Warden::Test::Helpers
Warden.test_mode!

# Feature: Doctor delete
#   As a doctor
#   I want to delete my doctor profile
#   So I can close my account
feature 'Doctor delete', :devise, :js do
	after(:each) do
		Warden.test_reset!
	end

	# Scenario: Doctor can delete own account
	#   Given I am signed in
	#   When I delete my account
	#   Then I should see an account deleted message
	scenario 'doctor can delete own account' do
		#skip 'skip a slow test'
		doctor = FactoryGirl.create(:doctor)
		login_as(doctor, :scope => :doctor)
		visit edit_doctor_registration_path(doctor)
		click_button 'Cancel my account'
		page.driver.browser.switch_to.alert.accept
		expect(page).to have_content I18n.t 'devise.registrations.destroyed'
	end
end
