class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.integer :first_user_id
      t.integer :second_user_id
      t.integer :winner
      t.integer :price
      t.string  :state

      t.timestamps
    end
  end
end
