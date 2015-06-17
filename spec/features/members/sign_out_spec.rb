# Feature: Sign out
#   As a doctor
#   I want to sign out
#   So I can protect my account from unauthorized access
feature 'Sign out', :devise do
	# Scenario: Doctor signs out successfully
	#   Given I am signed in
	#   When I sign out
	#   Then I see a signed out message
	scenario 'doctor signs out successfully' do
		doctor = FactoryGirl.create(:doctor)
		signin(doctor.email, doctor.password)
		expect(page).to have_content I18n.t 'devise.sessions.signed_in'
		click_link 'Log out'
		expect(page).to have_content I18n.t 'devise.sessions.signed_out'
	end
end
