1.upto(5).map do |n|
  Date.today.beginning_of_week(:sunday) + n.days + 9.hours
end.each do |time|
  Shift.create! start: time, length: 8.0
end
