require 'rails_helper'

RSpec.describe Blog, type: :model do
		let(:blog) {FactoryGirl.build :blog}
	it "must have a title" do
		# blog = FactoryGirl.build :blog
		blog.title = ""
		expect(blog).not_to be_valid
	end

	it "must have content"  do
		blog.content = ""
		expect(blog).not_to be_valid
	end
end
