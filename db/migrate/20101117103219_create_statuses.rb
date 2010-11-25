class CreateStatuses < ActiveRecord::Migration
  def self.up
    create_table :statuses do |t|
      t.references :user
      t.references :project
      t.text :task
      t.timestamps
    end
    execute "alter table statuses add constraint fk_user_id
        foreign key (user_id) references users(id)"
    execute "alter table statuses add constraint fk_project_id
        foreign key (project_id) references projects(id)"    
    add_index :statuses, :user_id
    add_index :statuses, :project_id
  end
  
  def self.down
    drop_table :statuses
  end
end
