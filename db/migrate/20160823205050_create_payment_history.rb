class CreatePaymentHistory < ActiveRecord::Migration[5.0]
  def change
    create_table :payment_histories do |t|
      t.integer :user_id
      t.string  :wallet_type
      t.string  :status
      t.string  :operation
      t.float   :amount
      t.string  :sign

      t.timestamps
    end
  end
end
