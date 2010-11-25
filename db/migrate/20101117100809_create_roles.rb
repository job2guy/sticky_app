class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name ,:null=>false
      t.string :description
      t.timestamps
    end
    Role.find_or_create_by_name(:name => 'Admin',:description=>"Administrator")
    Role.find_or_create_by_name(:name => 'Manager',:description=>"Manager")
    Role.find_or_create_by_name(:name => 'Developer',:description=>"Developer")
    Role.find_or_create_by_name(:name => 'PM',:description=>"Project Manager")
  end
  
  def self.down
    drop_table :roles
  end
end
