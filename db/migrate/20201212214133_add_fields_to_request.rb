class AddFieldsToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :viber,    :boolean
    add_column :requests, :telegram, :boolean
    add_column :requests, :whatsapp, :boolean
    add_column :requests, :request,  :text

    remove_column  :requests, :comment
    remove_column  :requests, :days
    remove_column  :requests, :from
    remove_column  :requests, :to

  end
end
