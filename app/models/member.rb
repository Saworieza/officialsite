class Member < ActiveRecord::Base
	validates :first_name, :last_name, :email, :mobile , presence: true
	EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, length: {maximum: 255}, uniqueness: {case_sensitive: false},
						format: {with: EMAIL_REGEX}
end
