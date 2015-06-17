include Warden::Test::Helpers
Warden.test_mode!

# Feature: Doctor profile page
#   As a doctor
#   I want to visit my doctor profile page
#   So I can see my personal account data
feature 'Doctor profile page', :devise do
	after(:each) do
		Warden.test_reset!
	end

	# Scenario: Doctor sees own profile
	#   Given I am signed in
	#   When I visit the doctor profile page
	#   Then I see my own email address
	scenario 'doctor sees own profile' do
		doctor = FactoryGirl.create(:doctor)
		login_as(doctor, :scope => :doctor)
		visit doctor_path(doctor)
		expect(page).to have_content doctor.email
	end

	# Scenario: Doctor cannot see another doctor's profile
	#   Given I am signed in
	#   When I visit another doctor's profile
	#   Then I see an 'access denied' message
	scenario "doctor cannot see another doctor's profile" do
		skip "to be decided later"
		me = FactoryGirl.create(:doctor)
		other = FactoryGirl.create(:doctor, email: 'other@example.com')
		login_as(me, :scope => :doctor)
		Capybara.current_session.driver.header 'Referer', root_path
		visit doctor_path(other)
		expect(page).to have_content 'Access denied.'
	end
end
