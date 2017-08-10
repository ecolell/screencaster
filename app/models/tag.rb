class Tag < ApplicationRecord
  has_many :taggings
  has_many :episodes, through: :taggings

  validates_presence_of :name
end
