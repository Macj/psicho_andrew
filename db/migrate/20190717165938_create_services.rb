class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.float :price_hr
      t.float :price_dl
      t.float :price_rb
      t.integer :visit_num
      t.attachment :logo

      t.timestamps null: false
    end
  end
end
