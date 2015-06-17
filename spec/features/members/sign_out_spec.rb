# Feature: Sign out
#   As a member
#   I want to sign out
#   So I can protect my account from unauthorized access
feature 'Sign out', :devise do
	# Scenario: Member signs out successfully
	#   Given I am signed in
	#   When I sign out
	#   Then I see a signed out message
	scenario 'member signs out successfully' do
		member = FactoryGirl.create(:member)
		signin(member.email, member.password)
		expect(page).to have_content I18n.t 'devise.sessions.signed_in'
		click_link 'Log out'
		expect(page).to have_content I18n.t 'devise.sessions.signed_out'
	end
end
