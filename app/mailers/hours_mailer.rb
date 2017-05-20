ApplicationMailer.delivery_method = :sendmail

class HoursMailer < ApplicationMailer
  default from: 'David Faulkenberry <mailer-noreply@hours.davidfaulkenberry.com>'
  default to: ['adam@umass.edu', 'betsyt@admin.umass.edu']
  # Just because I'm paranoid about how good I am at code
  default cc: ['david.faulkenberry@gmail.com']

  before_action do
    @shifts = params[:shifts]
    @td_styling = [
      'border: 1px solid grey;',
      'border-collapse: collapse;',
      'margin: 0;',
      'padding: 5px;'
    ].join ' '
    @th_styling = @td_styling + ' background: lightgrey;'
  end 

  def submit_timesheet
    mail subject: "Timesheet #{params[:start_date]} to #{params[:end_date]}",
      to: 'david.faulkenberry@gmail.com'
  end
end
