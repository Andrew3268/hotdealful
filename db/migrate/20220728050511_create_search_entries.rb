class CreateSearchEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :search_entries do |t|
      t.string :title
      t.string :link
      t.string :image
      t.string :source
      t.string :hashtag
      t.string :promocode
      t.string :rating
      t.string :rating_code
      t.string :review_count
      t.string :is_price
      t.string :was_price
      t.string :pct
      t.string :pct_coupon
      t.string :cash_coupon
      t.text :description

      
      t.references :searchable, polymorphic: true, null: false

      t.timestamps
    end
  end
end


