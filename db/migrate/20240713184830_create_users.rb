class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.float :height
      t.float :weight
      t.float :pas
      t.float :pad
      t.float :pam

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
