class Article < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_one_attached :video
  has_many :comments 
  validates :title, presence: true, length: {minimum: 3, maximum: 50} 
  validates :descrption, presence: true, length: {minimum: 50} 
  validates :user_id, presence: true

  validates :image, presence: true, unless: :photo_errors_exist?

 


  private
  def self.search(search)
    where("lower(articles.title) LIKE :search OR lower(articles.descrption) LIKE :search OR lower (users.username) LIKE :search", search:"%#{search.downcase}%").uniq
  end
  def photo_errors_exist?
    errors[:image].present?
  end

 
end