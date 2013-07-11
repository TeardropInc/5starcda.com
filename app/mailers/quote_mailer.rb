class QuoteMailer < ActionMailer::Base
  default from: "info@5starcda.com"

  def send_quote(email, name, phone, comment)
    @email = email
    @name = name
    @phone = phone
    @comment = comment
    mail(to: ENV["CONTACT_EMAIL"], from: "#{name} <#{email}>", subject: "Quote Request")
  end
end
