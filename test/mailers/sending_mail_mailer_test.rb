require 'test_helper'

class SendingMailMailerTest < ActionMailer::TestCase
  test "contact" do
    @faq = faqs(:one)
    mail = SendingMailMailer.contact
    assert_equal "アプリからのお問い合わせがあるよ", mail.subject
    assert_equal ['from@sakurariver.com'], mail.from
  end

end
