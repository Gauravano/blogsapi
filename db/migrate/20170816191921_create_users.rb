class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone_number
      t.integer :otp
      t.datetime :otp_expiry
      t.boolean :disabled

      t.timestamps null: false
    end
  end
end
