class Post < ApplicationRecord
	validates :title, presence: true
    validates :discription, presence: true
    validates :user_id, presence: true
    validates :user, presence: true 
	belongs_to :user
end
