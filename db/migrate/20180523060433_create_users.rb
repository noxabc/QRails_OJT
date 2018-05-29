class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :username
      t.string :password_digest
      t.string :password_confirmation
      t.string :mobile_number

      t.timestamps
    end
  end
end
