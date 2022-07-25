class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  validates :description, presence: true
  validates :name, presence: true
end
