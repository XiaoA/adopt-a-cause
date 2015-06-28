class User < ActiveRecord::Base
  has_many :project_users
  has_many :projects, through: :project_users

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 6}
  
end
