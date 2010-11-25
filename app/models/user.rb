class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :role
  has_many :statuses
  has_many :projects
  belongs_to :role
  
end
