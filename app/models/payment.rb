class Payment < ActiveRecord::Base
  #attr_accessible :phone, :email, :amount, :invoice_id, :stripe_token
  validates_presence_of :amount, :email

  as_enum :status,
    pending: 0,
    charged: 1,
    failed: 2

  after_initialize :set_default_status

  def charge_and_save
    if valid?
      charge = Stripe::Charge.create(
        :amount => (amount * 100).to_i, # amount in cents, again
        :currency => "usd",
        :card => stripe_token,
        :description => "#{phone} - #{email}"
      )
      self.update_attributes(status: :charged, last_four_digits: charge.card.last4)
      PaymentMailer.payment_succeeded(email, amount, charge.card.last4, invoice_id).deliver
      save!
    end
  rescue Stripe::CardError => e
    logger.error "Stripe charge error: #{e.message}"
    errors.add :base, e.message
    PaymentMailer.payment_declined(email, amount).deliver
    false
  rescue => e
    logger.error "Unknown error charging card: #{e.message}"
    errors.add :base, "There was a problem charging your card."
    false
  end

  private
  def set_default_status
    self.status ||= :pending
  end
end
