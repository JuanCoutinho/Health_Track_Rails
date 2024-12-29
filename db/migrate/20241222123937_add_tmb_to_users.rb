class AddTmbToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :tmb, :float
  end
end
