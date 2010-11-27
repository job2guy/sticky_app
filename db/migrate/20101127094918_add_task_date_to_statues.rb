class AddTaskDateToStatues < ActiveRecord::Migration
  def self.up
    add_column :statuses, :task_date , :date
    add_index :statuses , :task_date
  end

  def self.down
    remove_column :statuses, :task_date
  end
end
