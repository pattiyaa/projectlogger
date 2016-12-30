class CreateProjectsUsers < ActiveRecord::Migration[5.0]
  def self.up
    create_table :projects_users, id:false do |t|
      t.belongs_to :project, index: true
      t.belongs_to :user, index: true
    end
  end
  def self.down
  	drop_table :projects_users
  end
end
