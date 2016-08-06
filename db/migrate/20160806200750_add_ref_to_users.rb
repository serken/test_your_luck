class AddRefToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ref, :integer
  end
end
