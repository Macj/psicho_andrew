class AddViewCounterToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :view_counter, :integer
  end
end
