class SendingMailMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sending_mail_mailer.contact.subject
  #
  def contact
  @faq = Faq.last
    mail to: ENV["E_mail"], subject: "アプリへのお問い合わせがあるよ"
  end#heroku config:set E_mail="  "
end
