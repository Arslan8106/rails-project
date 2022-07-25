class Article < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image
  has_many :comments 
  validates :title, presence: true, length: {minimum: 3, maximum: 50} 
  validates :descrption, presence: true, length: {minimum: 50} 
  validates :user_id, presence: true
  validate :correct_image_type
  

  private
  def correct_image_type
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
        errors.add(:image, 'must be a JPEG or PNG.')
      elseif image.attached? == false
        errors.add(:image, 'must have an image attached')
    end
  end
end