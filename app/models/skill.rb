class Skill < ApplicationRecord
  belongs_to :character

  validates :name, presence: true
  validates :casting_time, presence: true
  validates :range, presence: true
  validates :duration, presence: true
end
