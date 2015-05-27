class Project < ActiveRecord::Base
  has_many :associations
  has_many :users, through: :associations
end
