class AddSlugToHotdeals < ActiveRecord::Migration[6.1]
  def change
    add_column :hotdeals, :slug, :string
    add_index :hotdeals, :slug, unique: true
  end
end
