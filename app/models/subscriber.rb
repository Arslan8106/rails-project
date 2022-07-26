class Subscriber < ApplicationRecord

    validates :name, :email, :source, presence: true
    validates :email, uniqueness: true

end
