class Character < ApplicationRecord
  has_many :skills
  has_one_attached :image

  validates :name, presence: true
end
