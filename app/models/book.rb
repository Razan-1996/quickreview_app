class Book < ApplicationRecord
    has_many :reviews , dependent: :destroy
    belongs_to :user
    belongs_to :category
end
