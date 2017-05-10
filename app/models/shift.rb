class Shift < ApplicationRecord
  validates :start, :length, presence: true
  validates :length, numericality: { greater_than: 0 }
  validate :quarter_hour_length

  BEGINNING_OF_TIME = Date.parse '2017-05-14'
  END_OF_TIME = Date.parse '2018-05-19'

  def date
    start.to_date
  end

  def end_time
    start + length.hours
  end

  def time
    start.to_time.strftime('%l:%M %P')
  end

  def self.in_range(range)
    where start: range
  end

  def self.on(date)
    where start: date.beginning_of_day..date.end_of_day
  end

  def self.new_on(date)
    new start: date + 9.hours, length: 8.0
  end

  private

  def quarter_hour_length
    return if [0.0, 0.25, 0.5, 0.75].include? length % 1
    errors.add :length, 'must be a multiple of 0.25'
  end
end
