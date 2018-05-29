class CreateLoads < ActiveRecord::Migration[5.2]
  def change
    create_table :loads do |t|
      t.integer :amount_loaded
      t.integer :remaining_load
      t.references :user, foreign_key: true
      t.references :transport_fare, foreign_key: true
      
      t.timestamps
    end
  end
end
