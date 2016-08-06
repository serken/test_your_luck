class CreateWallets < ActiveRecord::Migration[5.0]
  def change
    create_table :wallets do |t|
      t.string :number
      t.integer :user_id
      t.string :type
      t.timestamps
    end
  end
end
