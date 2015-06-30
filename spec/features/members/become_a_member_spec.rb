# Feature: Sign up
#   As a member
#   I want to sign up
#   So I can visit protected areas of the site
feature 'Sign Up', :devise do

  # Scenario: Member can sign up with valid email address and password
  #   Given I am not signed in
  #   When I sign up with a valid email address and password
  #   Then I see a successful sign up message
  scenario 'member can sign up with valid email address and password' do
		attribs = FactoryGirl.attributes_for(:member)
    sign_up_with('test@example.com','123456', 'please123', 'please123', attribs)
    txts = [I18n.t( 'devise.registrations.signed_up'), I18n.t( 'devise.registrations.signed_up_but_unconfirmed')]
    expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
  end

  # Scenario: Member cannot sign up with invalid email address
  #   Given I am not signed in
  #   When I sign up with an invalid email address
  #   Then I see an invalid email message
  scenario 'member cannot sign up with invalid email address' do
		skip "The tooltip takes care of this"
    sign_up_with('bogus', '123456', 'please123', 'please123')
    expect(page).to have_content 'Please enter an email address.'
  end
	 
  # Scenario: Member cannot sign up with invalid email address
  #   Given I am not signed in
  #   When I sign up with an invalid email address
  #   Then I see an invalid email message
  scenario 'member cannot sign up without mobile number' do
		attribs = FactoryGirl.attributes_for(:member)
    sign_up_with('test@example.com', '', 'please123', 'please123', attribs)
    expect(page).to have_content "Mobile can't be blank"
  end

  # Scenario: Member cannot sign up without password
  #   Given I am not signed in
  #   When I sign up without a password
  #   Then I see a missing password message
  scenario 'member cannot sign up without password' do
		attribs = FactoryGirl.attributes_for(:member)
    sign_up_with('test@example.com','123456', '', '', attribs)
    expect(page).to have_content "Password can't be blank"
  end

  # Scenario: Member cannot sign up with a short password
  #   Given I am not signed in
  #   When I sign up with a short password
  #   Then I see a 'too short password' message
  scenario 'member cannot sign up with a short password' do
		attribs = FactoryGirl.attributes_for(:member)
    sign_up_with('test@example.com','123456', 'pleas', 'pleas', attribs)
    expect(page).to have_content "Password is too short"
  end

  # Scenario: Member cannot sign up without password confirmation
  #   Given I am not signed in
  #   When I sign up without a password confirmation
  #   Then I see a missing password confirmation message
  scenario 'member cannot sign up without password confirmation' do
		attribs = FactoryGirl.attributes_for(:member)
    sign_up_with('test@example.com','123456', 'please123', '', attribs)
    expect(page).to have_content "Password confirmation doesn't match"
  end

  # Scenario: Member cannot sign up with mismatched password and confirmation
  #   Given I am not signed in
  #   When I sign up with a mismatched password confirmation
  #   Then I should see a mismatched password message
  scenario 'member cannot sign up with mismatched password and confirmation' do
		attribs = FactoryGirl.attributes_for(:member)
    sign_up_with('test@example.com','123456', 'please123', 'mismatch', attribs)
    expect(page).to have_content "Password confirmation doesn't match"
  end

end

