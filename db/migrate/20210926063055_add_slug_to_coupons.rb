class AddSlugToCoupons < ActiveRecord::Migration[6.1]
  def change
    add_column :coupons, :slug, :string
    add_index :coupons, :slug, unique: true
  end
end
