class CreateLogs < ActiveRecord::Migration[5.0]
  def self.up
  	
    create_table :logs do |t|
      t.datetime :logdate
      t.string :data
      t.references :logperson
      t.belongs_to :project, index: true
      t.timestamps
    end
  end
  def self.down
  	drop_table :logs
  end
end
