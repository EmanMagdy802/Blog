class Post < ApplicationRecord
    validates :title, :content, presence: true
    validates :title, uniqueness: true
    belongs_to :user
    has_many :comments
end
