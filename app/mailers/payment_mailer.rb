class PaymentMailer < ActionMailer::Base
  default from: "5 Star Services <#{ENV["CONTACT_EMAIL"]}>"

  def payment_succeeded(email, amount, last4, invoice)
    @email = email
    @amount = amount
    @last4 = last4
    @invoice = invoice
    mail(to: email, subject: "Your invoice has been paid")
  end

  def payment_declined(email, amount)
    @email = email
    @amount = amount
    mail(to: email, cc: ENV["CONTACT_EMAIL"], subject: "Your card was declined")
  end
end
