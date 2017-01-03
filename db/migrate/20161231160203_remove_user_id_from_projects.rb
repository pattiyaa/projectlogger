class RemoveUserIdFromProjects < ActiveRecord::Migration[5.0]
  def self.up
    remove_column :projects, :user_id
    add_column :projects, :projectmanager_id, :integer
  end
  def self.down
  	
  	add_column :projects, :user_id, :integer
  	remove_column :projects, :projectmanager_id
  end
end
