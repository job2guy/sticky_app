class Status < ActiveRecord::Base
   validates_presence_of :task
   validates_uniqueness_of :task , :scope=>[:user_id,:project_id]
   belongs_to :user
   belongs_to :project
end
