class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :episode

  validates_presence_of :tag, :episode
end
