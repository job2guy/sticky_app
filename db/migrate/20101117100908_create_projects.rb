class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name , :null=>false
      t.string :description 
      t.timestamps
    end
    Project.find_or_create_by_name(:name => 'Activcontrol',:description=>"Activcontrol")
    Project.find_or_create_by_name(:name => 'BlacksheepPRD',:description=>"Blacksheep production")
    Project.find_or_create_by_name(:name => 'BlacksheepDEV',:description=>"Blacksheep development")
    Project.find_or_create_by_name(:name => 'Formative',:description=>"Formative Teaching")
    Project.find_or_create_by_name(:name => 'NEB',:description=>"New Equity Business")
    Project.find_or_create_by_name(:name => 'nComputing',:description=>"nComputing")
    Project.find_or_create_by_name(:name => 'Quaddeals',:description=>"Quaddeals")
   
  end
  
  def self.down
    drop_table :projects
  end
end
