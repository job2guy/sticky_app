class AddRoleToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :role_id , :integer , :null=>false
    execute "alter table users add constraint fk_role_id
        foreign key (role_id) references roles(id)"
  end

  def self.down
    remove_column :users, :role_id
  end
end
