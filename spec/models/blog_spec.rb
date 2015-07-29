require 'rails_helper'

RSpec.describe Blog, type: :model do
	let(:blog) {FactoryGirl.build :blog}
	context "title" do
		it "can not be blank" do
			# blog = FactoryGirl.build :blog
			blog.title = ""
			expect(blog).not_to be_valid
		end

		it 'rejects less than 15 characters' do
			title = "e"*14
			blog.title = title
			expect(blog).not_to be_valid
		end
		it 'accepts more than 15 characters' do
			title = 'e'*16
			blog.title= title
			expect(blog).to be_valid
		end

	end

	it "must have content"  do
		blog.content = ""
		expect(blog).not_to be_valid
	end
end
