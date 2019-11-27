class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :client_id
      t.text :comment
      t.string :days
      t.string :from
      t.string :to

      t.timestamps null: false
    end
  end
end
