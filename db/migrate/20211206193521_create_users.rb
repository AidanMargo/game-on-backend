class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :city
      t.string :profile_pic
      t.string :password_digest
      t.string :password_confirmation

      t.timestamps
    end
  end
end
