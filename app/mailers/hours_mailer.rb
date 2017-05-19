ApplicationMailer.delivery_method = :sendmail

class HoursMailer < ApplicationMailer
  default from: 'mailer-noreply@hours.davidfaulkenberry.com'
  default to: ['adam@umass.edu', 'betsyt@admin.umass.edu']
  # Just because I'm paranoid about how good I am at code
  default cc: ['david.faulkenberry@gmail.com']

  before_action do
    @shifts = params[:shifts]
    @start_date = params[:start_date]
    @end_date = params[:end_date]
  end 

  def submit_timesheet
    mail subject: "Timesheet #{@start_date} to #{@end_date}"
  end
end
