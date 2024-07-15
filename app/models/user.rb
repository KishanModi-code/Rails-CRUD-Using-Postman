class User < ApplicationRecord
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :mobilenumber, presence: true
  has_many :posts, dependent: :destroy

end
