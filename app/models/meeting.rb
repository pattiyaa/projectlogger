class Meeting < ApplicationRecord
  belongs_to :logperson ,class_name: 'User', foreign_key: 'logger_id'
  has_and_belongs_to_many :users
  belongs_to :project
end
