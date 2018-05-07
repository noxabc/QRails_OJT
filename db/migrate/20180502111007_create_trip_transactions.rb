class CreateTripTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_transactions do |t|
      t.string :pickup_location
      t.string :drop_location
      t.integer :trip_amount
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
