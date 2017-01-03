class AddTitleToUser < ActiveRecord::Migration[5.0]
  def self.up
    add_column :users, :title, :string
  end
  def self.down
  	remove_column :user, :title
  end
end
