class Post < ApplicationRecord
  validates :title, presence: true
  validates :discription, presence: true
  validates :user_id, presence: true
  validates :user, presence: true 
  belongs_to :user
  attr_accessor :image_url
  validates :image_url, format: { with: /\Ahttps?:\/\/.*\.(png|jpg|jpeg|gif)\z/i }, allow_blank: true
end
