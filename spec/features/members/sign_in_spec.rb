# Feature: Sign in
#   As a member
#   I want to sign in
#   So I can visit protected areas of the site
feature 'Sign in', :devise do
	# Scenario: User cannot sign in if not registered
	#   Given I do not exist as a member
	#   When I sign in with valid credentials
	#   Then I see an invalid credentials message
	scenario 'member cannot sign in if not registered' do
		signin('test@example.com', 'please123')
		expect(page).to have_content I18n.t 'devise.failure.not_found_in_database', authentication_keys: 'email'
	end

	# Scenario: User can sign in with valid credentials
	#   Given I exist as a member
	#   And I am not signed in
	#   When I sign in with valid credentials
	#   Then I see a success message
	scenario 'member can sign in with valid credentials' do
		member = FactoryGirl.create(:member)
		signin(member.email, member.password)
		expect(page).to have_content I18n.t 'devise.sessions.signed_in'
	end

	# Scenario: User cannot sign in with wrong email
	#   Given I exist as a member
	#   And I am not signed in
	#   When I sign in with a wrong email
	#   Then I see an invalid email message
	scenario 'member cannot sign in with wrong email' do
		member = FactoryGirl.create(:member)
		signin('invalid@email.com', member.password)
		expect(page).to have_content I18n.t 'devise.failure.not_found_in_database', authentication_keys: 'email'
	end

	# Scenario: User cannot sign in with wrong password
	#   Given I exist as a member
	#   And I am not signed in
	#   When I sign in with a wrong password
	#   Then I see an invalid password message
	scenario 'member cannot sign in with wrong password' do
		member = FactoryGirl.create(:member)
		signin(member.email, 'invalidpass')
		expect(page).to have_content I18n.t 'devise.failure.invalid', authentication_keys: 'email'
	end
end
