class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # has_many :projects, class_name: 'Project', primary_key: 'id', foreign_key: 'projectmanager'
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :meetings
  #mount_uploader :image, PictureUploader
  has_one :image, :class_name => "Ckeditor::Picture",:as => "assetable"
end
