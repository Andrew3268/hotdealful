class AddSlugToWpReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :wp_reviews, :slug, :string
    add_index :wp_reviews, :slug, unique: true
  end
end
