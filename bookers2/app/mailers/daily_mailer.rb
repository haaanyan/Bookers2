class DailyMailer < ApplicationMailer

  def daily_mailer
    mail(to: User.pluck(:email), subject: "Daily Mail")
  end

end