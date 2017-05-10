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

  # Normally we wouldn't nil-handle something whose presence we validate,
  # but this accommodates stock new objects.
  def time
    start.try(:to_time).try(:strftime, '%l:%M %P')
  end

  def self.in_range(range)
    where start: range
  end

  def self.initialize_week(start_date)
    start_date.upto(start_date + 6.days).each do |date|
      create! start: date + 9.hours, length: 8.0 if date.on_weekday?
    end
  end

  def self.on(date)
    where start: date.beginning_of_day..date.end_of_day
  end

  def self.submit_week(range)
    shifts = in_range range
    HoursMailer.with(shifts: shifts).submit_timesheet.deliver_now
  end

  private

  def quarter_hour_length
    return if [0.0, 0.25, 0.5, 0.75].include? length % 1
    errors.add :length, 'must be a multiple of 0.25'
  end
end
