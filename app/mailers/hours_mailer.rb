class HoursMailer < ApplicationMailer
  default from: 'david.faulkenberry@gmail.com'
  default to: ['adam@umass.edu', 'betsyt@admin.umass.edu']
  # Just because I'm paranoid about how good I am at code
  default bcc: ['david.faulkenberry@gmail.com']

  before_action { @shifts = params[:shifts] }

  def submit_timesheet
    mail subject: "Timesheet #{params[:start_date]} to #{params[:end_date]}"
  end
end
