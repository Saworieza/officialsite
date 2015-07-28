FactoryGirl.define do
	factory :blog do
		title Faker::Lorem.sentence 
		content Faker::Lorem.paragraph(3) 
	end
end
