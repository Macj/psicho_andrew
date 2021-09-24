class AddReadTimeToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :reading_time, :string
  end
end
