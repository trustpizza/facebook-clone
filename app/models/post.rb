class Post < ApplicationRecord
  # Validations 
  validates :body, presence: true, length: { maximum: 300 }
  validates :title, presence: true

  # Associations
  belongs_to :author, class_name: "User"
  has_many :likes, dependent: :destroy 
  has_many :comments, dependent: :destroy 
  
end