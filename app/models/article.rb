class Article < ApplicationRecord
  
  has_one_attached :image
  validates :title, presence: true, length: {minimum: 3, maximum: 50} 
  validates :descrption, presence: true
end