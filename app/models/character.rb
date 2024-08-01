class Character < ApplicationRecord
  has_many :skills
  has_many :items
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :total_hitpoints, presence: true
  validates :total_resource, presence: true
  validates :image, presence: true
end
