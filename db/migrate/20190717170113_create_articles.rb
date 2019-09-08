class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :cathegory, index: true, foreign_key: true
      t.integer :style, :limit => 1
      t.string :tags
      t.attachment :image
      t.timestamps null: false
    end
  end
end
