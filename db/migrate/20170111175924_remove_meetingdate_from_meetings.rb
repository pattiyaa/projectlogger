class RemoveMeetingdateFromMeetings < ActiveRecord::Migration[5.0]
  def change
  	remove_column :meetings, :meetingdate
  	add_column :meetings , :meetingdate, :datetime 
  end
end
