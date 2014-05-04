class User < ActiveRecord::Base
	include Gravtastic
  gravtastic secure: true, default: "mm", size: 45

	has_secure_password
	validates_uniqueness_of :email, on: :create
	validates_presence_of :email, on: :create
	validates_numericality_of :document, only_integer: true
end