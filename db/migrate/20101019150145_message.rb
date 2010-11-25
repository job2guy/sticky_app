class Message < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.text :type
      t.integer :sender_id 
      t.integer :receiver_id
      t.timestamps
    end
  execute "alter table messages add constraint fk_sender_id foreign key (sender_id) references users(id)"
  execute "alter table messages add constraint fk_receiver_id foreign key (receiver_id) references users(id)"
  end

  def self.down
    drop_table :messages
  end
end
