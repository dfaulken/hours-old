class Submission < ApplicationRecord
  validates :start, presence: true

  def self.for(date)
    where start: date
  end
end
