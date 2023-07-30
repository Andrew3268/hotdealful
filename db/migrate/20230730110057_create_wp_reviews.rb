class CreateWpReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :wp_reviews do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
