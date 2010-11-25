class Project < ActiveRecord::Base
   validates_presence_of :name
   validates_uniqueness_of :name
   has_many :statuses
   has_many :users
end
