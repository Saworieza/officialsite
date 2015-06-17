FactoryGirl.define do
	factory :member do
		first_name Faker::Name.first_name
		last_name Faker::Name.last_name
		email Faker::Internet.safe_email
		mobile Faker::PhoneNumber.cell_phone
		password Faker::Lorem.characters(8)
	end
end
