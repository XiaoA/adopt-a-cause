class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :email, :phone_number, :password_digest
      t.timestamps
    end
  end
end
