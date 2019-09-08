class AddIgreeToClient < ActiveRecord::Migration
  def change
    add_column :clients, :agree, :boolean
  end
end
