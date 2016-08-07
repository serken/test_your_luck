class AddRefToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ref, :integer
    add_column :users, :pm_wallet, :string
    add_column :users, :okpay_wallet, :string
    add_column :users, :payeer_wallet, :string
    add_column :users, :score, :float, default: 0
  end
end
