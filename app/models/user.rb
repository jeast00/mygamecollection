class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email, message: "email has already been taken."
  has_many :games
end
