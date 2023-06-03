class AddSlugToBloggers < ActiveRecord::Migration[6.1]
  def change
    add_column :bloggers, :slug, :string
    add_index :bloggers, :slug, unique: true
  end
end
