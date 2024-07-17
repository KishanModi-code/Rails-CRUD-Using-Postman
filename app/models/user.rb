class User < ApplicationRecord
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :mobilenumber, presence: true
  has_many :posts, dependent: :destroy
  validates :avatar_url, format: { with: /\Ahttps?:\/\/.*\.(png|jpg|jpeg|gif)\z/i }, allow_blank: true
  attr_accessor :avatar_url
  attr_accessor :username
  def set_username
    self.username = "#{firstname}_#{lastname}" if firstname.present? && lastname.present?
  end
end
