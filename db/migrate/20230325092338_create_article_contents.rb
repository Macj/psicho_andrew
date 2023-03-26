class CreateArticleContents < ActiveRecord::Migration[5.0]
  def change
    create_table :article_contents do |t|
      t.string :ln, default: :ua
      t.string :title
      t.text :body
      t.text :description
      t.string :tags
      t.references :article, index: true, foreign_key: true
    end
  end
end