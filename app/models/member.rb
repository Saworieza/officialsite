class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
	# validates :first_name, :last_name, :email, :mobile , presence: true
	# EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	# validates :email, length: {maximum: 255}, uniqueness: {case_sensitive: false},
	# 					format: {with: EMAIL_REGEX}
end
