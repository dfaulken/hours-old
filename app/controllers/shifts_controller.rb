class ShiftsController < ApplicationController
  before_action :set_shift, only: %i[destroy update]
  before_action :parse_dates, only: :index

  def create
    @shift = Shift.create! shift_params
    redirect_to shifts_url(start_date: @shift.date)
  end

  def destroy
    @shift.destroy
    redirect_to shifts_url(start_date: @shift.date)
  end

  def index
    @shifts = Shift.in_range(@start_date.beginning_of_day..@end_date.end_of_day)
                   .order(:start)
    @dates = @start_date.upto @end_date
    @total_hours = @shifts.sum :length
  end

  def update
    @shift.update! shift_params
    redirect_to shifts_url(start_date: @shift.date)
  end

  private

  def parse_dates
    start_date = if params[:start_date].present?
                    Date.parse params[:start_date]
                  else Date.today
                  end.beginning_of_week(:sunday)
    start_date = [Shift::BEGINNING_OF_TIME, start_date].max
    @start_date = [start_date, Shift::END_OF_TIME - 6.days].min
    @end_date = @start_date.end_of_week(:sunday)
  end

  def parse_hours(time)
    time = Time.strptime time, '%H:%M %p'
    time.hour + time.min / 60.0
  end

  def set_shift
    @shift = Shift.find(params[:id])
  end

  def shift_params
    params_in = params.require(:shift).permit(:date, :time, :length)
    start = Date.parse(params_in[:date]) + parse_hours(params_in[:time]).hours
    params_in.except(:date, :time).merge(start: start)
  end
end
