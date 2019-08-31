# Preview all emails at http://localhost:3000/rails/mailers/sending_mail_mailer
class SendingMailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sending_mail_mailer/contact
  def contact
    SendingMailMailer.contact
  end

end
