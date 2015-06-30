module Features
	module SessionHelpers
		def sign_up_with(email,mobile, password, confirmation, attribs)
			visit new_member_registration_path
			fill_in 'First Name', with: attribs[:first_name]
			fill_in 'Last Name', with: attribs[:last_name]
			fill_in 'Email', with: email
			fill_in 'Password', with: password
			fill_in 'Mobile', with: mobile
			fill_in 'Password confirmation', :with => confirmation
			click_button 'Make me a member'
		end

		def signin(email, password)
			visit new_member_session_path
			fill_in 'Email', with: email
			fill_in 'Password', with: password
			click_button 'Log in'
		end

	end
end
