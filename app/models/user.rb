class User < ActiveRecord::Base
	has_secure_password
	validates_uniqueness_of :email, on: :create
	validates_presence_of :email, on: :create
	validates :document, numericality: {only_integer: true}
end
