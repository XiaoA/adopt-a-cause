class User < ActiveRecord::Base
  has_many :associations
  has_many :projects, through: :associations

  has_secure_password
end
