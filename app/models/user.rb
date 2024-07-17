class User < ApplicationRecord
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :mobilenumber, presence: true
  has_many :posts, dependent: :destroy
  validates :avatar_url, format: { with: /\Ahttps?:\/\/.*\.(png|jpg|jpeg|gif)\z/i }, allow_blank: true
end
