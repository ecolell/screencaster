
PaperTrail::Version.allow_shard :episodes

# :nodoc:
class Episode < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings
  allow_shard :episodes

  validates_presence_of :name, :description
  scope :published, -> { where('published_on <= ?', Time.now.to_date) }
  scope :matching_with, lambda { |pattern|
    query = 'name like :pattern or description like :pattern'
    where(query, pattern: "%#{pattern}%")
  }

  #has_paper_trail

  def timecode
    return unless seconds
    min, sec = *seconds.divmod(60)
    [min, sec.to_s.rjust(2, '0')].join(':')
  end

  def timecode=(timecode)
    return unless timecode.present?
    min, sec = *timecode.split(':').map(&:to_i)
    self.seconds = min * 60 + sec
  end

  def minutes
    (seconds / 60.0).round if seconds
  end
end
