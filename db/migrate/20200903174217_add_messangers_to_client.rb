class AddMessangersToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :viber, :boolean
    add_column :clients, :telegram, :boolean
    add_column :clients, :whatsup, :boolean
  end
end
