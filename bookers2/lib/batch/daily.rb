class Batch::Daily
 def mail
  DailyMailer.daily_mailer.deliver_now
 end
end