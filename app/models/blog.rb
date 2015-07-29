class Blog < ActiveRecord::Base
	validates :title, :content, presence: true
	validates :title, length: {minimum: 15}
end
