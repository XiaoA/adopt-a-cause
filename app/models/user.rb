class User < ActiveRecord::Base
  has_many :associations
  has_many :projects, through: :associations
end
