include Warden::Test::Helpers
Warden.test_mode!

feature 'Member join user group', :devise do
	after(:each) do
		Warden.test_reset!
	end

	scenario 'member must log in to join group' do
		member=FactoryGirl.create(:member)
		group= FactoryGirl.create(:user_group)
		visit edit_member_path(member)
		expect(page).to have_content I18n.t 'devise.failure.unauthenticated'
	end

	scenario 'signed in member joins one group' do
		member=FactoryGirl.create(:member)
		group= FactoryGirl.create(:user_group)
		login_as(member, :scope => :member)
		visit edit_member_path(member)
		check 'Linux User Group'
		click_button 'Update Member'
		expect(page).to have_content('Your details have been updated!')

	end

	scenario 'signed in member joins multiple group' do
		member=FactoryGirl.create(:member)
		group= FactoryGirl.create(:user_group)
		group2= FactoryGirl.create(:user_group, name: "Python User Group")
		login_as(member, :scope => :member)
		visit edit_member_path(member)
		check 'Linux User Group'
		check 'Python User Group'
		click_button 'Update Member'
		expect(page).to have_content('Your details have been updated!')

	end

	scenario 'member profile shows groups joined' do
		member=FactoryGirl.create(:member)
		group= FactoryGirl.create(:user_group)
		group2= FactoryGirl.create(:user_group, name: "Python User Group")
		member.user_group_ids=[group.id, group2.id]
		login_as(member, :scope => :member)
		visit edit_member_path(member)
		check 'Linux User Group'
		check 'Python User Group'
		click_button 'Update Member'
		visit member_path(member)
		expect(page).to have_content(group.name)
		expect(page).to have_content(group2.name)

	end
end
