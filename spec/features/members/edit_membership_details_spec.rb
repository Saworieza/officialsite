include Warden::Test::Helpers
Warden.test_mode!

# Feature: Doctor edit
#   As a doctor
#   I want to edit my doctor profile
#   So I can change my email address
feature 'Doctor edit', :devise do
	after(:each) do
		Warden.test_reset!
	end

	# Scenario: Doctor changes email address
	#   Given I am signed in
	#   When I change my email address
	#   Then I see an account updated message
	scenario 'doctor changes email address' do
		doctor = FactoryGirl.create(:doctor)
		login_as(doctor, :scope => :doctor)
		visit edit_doctor_registration_path(doctor)
		fill_in 'Email', :with => 'newemail@example.com'
		fill_in 'Current password', :with => doctor.password
		click_button 'Update'
		txts = [I18n.t( 'devise.registrations.updated'), I18n.t( 'devise.registrations.update_needs_confirmation')]
		expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
	end

	# Scenario: Doctor cannot edit another doctor's profile
	#   Given I am signed in
	#   When I try to edit another doctor's profile
	#   Then I see my own 'edit profile' page
	scenario "doctor cannot cannot edit another doctor's profile", :me do
		me = FactoryGirl.create(:doctor)
		other = FactoryGirl.create(:doctor, email: 'other@example.com')
		login_as(me, :scope => :doctor)
		visit edit_doctor_registration_path(other)
		expect(page).to have_content 'Edit Doctor'
		expect(page).to have_field('Email', with: me.email)
	end
end
