class RenameTypeColumnInPhonesToPhoneType < ActiveRecord::Migration[7.0]
  def change
    rename_column :phones, :type, :phone_type
  end
end
