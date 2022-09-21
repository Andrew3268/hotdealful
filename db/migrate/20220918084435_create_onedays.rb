class CreateOnedays < ActiveRecord::Migration[6.1]
  def change
    create_table :onedays do |t|
      t.integer :user_id
      t.string :o_title
      t.string :o_link
      t.string :o_image
      t.string :o_promocode
      t.float :o_rating
      t.integer :o_rating_code
      t.float :o_review_count
      t.string :o_year
      t.string :o_month
      t.string :o_day
      t.decimal :o_is_price
      t.decimal :o_was_price
      t.decimal :o_pct
      t.decimal :o_cash_coupon
      t.decimal :o_pct_coupon
      t.text :o_description

      t.string :o_spare_01
      t.string :o_spare_02
      t.string :o_spare_03
      t.string :o_spare_04
      t.string :o_spare_05
      
      t.float :o_spare_41
      t.float :o_spare_42
      
      t.integer :o_spare_56
      t.integer :o_spare_57

      t.decimal :o_spare_61
      t.decimal :o_spare_62
      
      t.datetime :o_spare_66
      t.datetime :o_spare_67
      
      t.date :o_spare_71
      t.date :o_spare_72      

      t.timestamps
    end
  end
end
