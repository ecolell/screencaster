class Episode < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings

  validates_presence_of :name, :description
  scope :published, -> { where('published_on <= ?', Time.now.to_date) }
  scope :matching_with, -> (pattern) { where('name like :pattern or description like :pattern', pattern: "%#{pattern}%")}

  has_paper_trail

  def timecode
    if seconds
      min, sec = *seconds.divmod(60)
      [min, sec.to_s.rjust(2, '0')].join(':')
    end
  end

  def timecode=(timecode)
    if timecode.present?
      min, sec = *timecode.split(':').map(&:to_i)
      self.seconds = min*60 + sec
    end
  end

  def minutes
    (seconds/60.0).round if seconds
  end
end
