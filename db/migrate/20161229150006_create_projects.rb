class CreateProjects < ActiveRecord::Migration[5.0]
  def self.up
    create_table :projects do |t|
      t.string :name
      t.text :detail
      t.date :start_date
      t.date :end_date
      t.boolean :active
      t.integer :seq
      t.references :user
      t.belongs_to :client, index: true
      t.timestamps
    end
  end
  def self.down
     drop_table :projects
  end
end
