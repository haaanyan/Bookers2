class NotificationMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def notification_email(email, name)
    @name = name
    mail(to: email, subject: '会員登録が完了しました')
  end

end
