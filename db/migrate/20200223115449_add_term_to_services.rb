class AddTermToServices < ActiveRecord::Migration[5.0]
  def change
    add_column :services, :term, :string
  end
end
