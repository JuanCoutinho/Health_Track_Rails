class AddPhoneTypeToPhones < ActiveRecord::Migration[7.1]
  def change
    add_column :phones, :phone_type, :string
  end
end
