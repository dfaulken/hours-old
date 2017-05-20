ApplicationMailer.delivery_method = :sendmail

class HoursMailer < ApplicationMailer
  default from: 'David Faulkenberry <mailer-noreply@hours.davidfaulkenberry.com>'
  default to: ['adam@umass.edu', 'betsyt@admin.umass.edu']
  # Just because I'm paranoid about how good I am at code
  default cc: ['david.faulkenberry@gmail.com']

  before_action do
    @shifts = params[:shifts]
  end 

  def submit_timesheet
    mail subject: "Timesheet #{params[:start_date]} to #{params[:end_date]}",
      to: 'david.faulkenberry@gmail.com'
  end
end
