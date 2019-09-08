class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.text :query
      t.text :answer

      t.timestamps null: false
    end
  end
end
