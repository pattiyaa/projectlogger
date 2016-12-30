class Project < ApplicationRecord
  belongs_to :projectmanager, class_name: 'User', foreign_key: 'user_id'
  belongs_to :client
  has_and_belongs_to_many :users
end
