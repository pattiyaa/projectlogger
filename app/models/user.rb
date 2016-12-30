class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_many :projects, class_name: 'Project', primary_key: 'id', foreign_key: 'projectmanager'
  has_and_belongs_to_many :projects
  mount_uploader :image, PictureUploader
end
