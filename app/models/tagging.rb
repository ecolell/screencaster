# :nodoc:
class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :episode
  allow_shard :tags

  validates_presence_of :tag, :episode
end
