class Log < ApplicationRecord
  belongs_to :logperson,class_name: 'User'
  belongs_to :project
  has_many :pictures, :class_name => "Ckeditor::Picture",:as => "assetable"
  
end
