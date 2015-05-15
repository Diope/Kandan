class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]+\z/

	validates :name, presence: true, length: {maximum: 45}
	validates :username, presence: true, length: {in: 3..25}
	validates :email, presence: true, length: {maximum: 255},
										format: {with: VALID_EMAIL_REGEX},
										uniqueness: {case_sensitivie: false}
end
