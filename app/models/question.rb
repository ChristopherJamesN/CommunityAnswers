class Question < ApplicationRecord
  validates :content,  :presence => true
  belongs_to :user
  has_many :answeredquestions
  mount_uploader :image, ImageUploader
end
