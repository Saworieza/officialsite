require 'rails_helper'

RSpec.describe Member, type: :model do
	 it "responds to all attributes" do
	  	member=FactoryGirl.build(:member)
	  	expect(member).to respond_to(:first_name, :last_name, :mobile, :email)
	  end

	 context "required field" do
	 	let(:member){FactoryGirl.build(:member)}
	 	it "first_name is not blank" do
	 		member.first_name = ""
	 		expect(member).not_to be_valid
	 	end
	 	it "last_name is not blank" do
	 		member.last_name = ""
	 		expect(member).not_to be_valid
	 	end
	 	it "mobile is not blank" do
	 		member.mobile = ""
	 		expect(member).not_to be_valid
	 	end
	 	it "email is not blank" do
			skip "handled by devise"
	 		member.email = ""
	 		expect(member).not_to be_valid
	 	end
	 end
	 context "email" do
	 	let(:member){FactoryGirl.build(:member)}
	 	it "rejects invalid emails" do
			skip "handled by devise"
	 		invalid_email = %w{ user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com}
	 		invalid_email.each do |invalid|
	 			member.email = invalid
	 			expect(member).not_to be_valid
	 		end
	 	end
	 	it "accepts correct emails" do
			skip "handled by devise"
	 		valid_email = %w{user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn}
	 		valid_email.each do |valid|
	 			member.email = valid
	 			expect(member).to be_valid
	 		end
	 	end
	 	it "is not too long" do
			skip "handled by devise"
			long_email = "a"*256+"@gmi.com"
			member.email = long_email
			expect(member).not_to be_valid	
		end
	 end
	 context "uniquness of" do
	 	let(:member){FactoryGirl.create(:member)}
	 	it "email" do
			skip "handled by devise"
	 		duplicate_member = member.dup
	 		duplicate_member.email = duplicate_member.email.upcase
	 		expect(duplicate_member).not_to be_valid
	 	end
	 end
end
