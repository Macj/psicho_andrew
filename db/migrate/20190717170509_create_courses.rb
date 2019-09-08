class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :programm
      t.text :video
      t.string :shipping_type
      t.string :term
      t.float :coast_rb
      t.float :coast_dl
      t.float :coast_hr
      t.text :description

      t.timestamps null: false
    end
  end
end
