class CreateMettingsUsers < ActiveRecord::Migration[5.0]
  def self.up
    create_table :meetings_users, id: false  do |t|
      t.belongs_to :meeting,  index: true
      t.belongs_to :user,  index: true
    end
  end
  def self.down
  	drop_table :meetings_users
  end
end
