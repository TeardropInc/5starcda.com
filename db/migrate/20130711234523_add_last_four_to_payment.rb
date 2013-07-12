class AddLastFourToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :last_four_digits, :integer
  end
end
