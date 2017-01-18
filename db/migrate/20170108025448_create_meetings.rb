class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.string :meetingdate
      t.string :title
      t.string :data
      t.references :logger
      t.belongs_to :project, index: true

      t.timestamps
    end
  end
end
