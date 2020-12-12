class AddFieldsToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :personal_info, :boolean
    add_column :clients, :contract, :boolean
  end
end
