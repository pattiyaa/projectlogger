class AddTelephoneToUsers < ActiveRecord::Migration[5.0]
  def self.up
    add_column :users, :telephone, :string
  end
  def self.down
    remove_column :users, :telephone
  end
end
