class CreateCathegories < ActiveRecord::Migration
  def change
    create_table :cathegories do |t|
      t.references :parent
      t.boolean :is_pro
      t.string :parent_link
      t.integer :level
      t.attachment :logo
      t.string :name
      t.boolean :visible

      t.timestamps null: false
    end
  end
end
