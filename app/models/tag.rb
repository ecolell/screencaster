# :nodoc:
class Tag < ApplicationRecord
  has_many :taggings
  has_many :episodes, through: :taggings
  allow_shard :tags

  validates_presence_of :name
end
