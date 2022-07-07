class Article < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :descrption, presence: true {minimum: 10, maximum: 250}
end