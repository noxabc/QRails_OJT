class CreateBalanceLoads < ActiveRecord::Migration[5.2]
  def change
    create_table :balance_loads do |t|
      t.integer :amount_loaded
      t.integer :remaining_load
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
