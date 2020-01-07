class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :title
      t.string :place
      t.date :from
      t.date :till
      t.attachment :logo

      t.timestamps null: false
    end
  end
end
