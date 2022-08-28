class Genre < ApplicationRecord
  has_many :items
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
end
