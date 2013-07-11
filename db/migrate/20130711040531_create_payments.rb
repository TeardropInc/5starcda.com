class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :invoice_id
      t.string :stripe_token
      t.string :email
      t.string :phone
      t.decimal :amount

      t.timestamps
    end
  end
end
