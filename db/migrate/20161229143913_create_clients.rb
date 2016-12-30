class CreateClients < ActiveRecord::Migration[5.0]
  def self.up
    create_table :clients do |t|
      t.string :name
      t.string :contactperson
      t.string :telephone
      t.string :email
      t.text :address

      t.timestamps
    end
  end
  def self.down
    drop_table :clients
  end
end
