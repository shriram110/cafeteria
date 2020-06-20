class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "role"
      t.string "email_id"
      t.string "password_digest"
      t.boolean "email_confirmed", default: false
      t.string "confirm_token"
      t.timestamps
    end
  end
end
