class CreateHotdeals < ActiveRecord::Migration[6.1]
  def change
    create_table :hotdeals do |t|
      t.integer :user_id
      t.string :deal_title
      t.string :deal_link
      t.string :deal_image
      t.string :deal_source
      t.string :deal_hashtag
      t.float :deal_rating
      t.integer :deal_rating_code
      t.float :deal_review_count
      t.decimal :deal_is_price
      t.decimal :deal_was_price
      t.decimal :deal_pct
      t.decimal :deal_cash_coupon
      t.decimal :deal_pct_coupon
      t.text :deal_description

      t.string :deal_spare_01
      t.string :deal_spare_02
      t.string :deal_spare_03
      t.string :deal_spare_04
      t.string :deal_spare_05
      t.string :deal_spare_06
      t.string :deal_spare_07
      t.string :deal_spare_08
      t.string :deal_spare_09
      t.string :deal_spare_10
      t.string :deal_spare_11
      t.string :deal_spare_12
      t.string :deal_spare_13
      t.string :deal_spare_14
      t.string :deal_spare_15
    
      t.text :deal_spare_31
      t.text :deal_spare_32
       
      t.float :deal_spare_41
      t.float :deal_spare_42
      t.float :deal_spare_43
      t.float :deal_spare_44
      t.float :deal_spare_45
     
      t.integer :deal_spare_56
      t.integer :deal_spare_57
      t.integer :deal_spare_58
      t.integer :deal_spare_59
      t.integer :deal_spare_60

      t.decimal :deal_spare_61
      t.decimal :deal_spare_62
      t.decimal :deal_spare_63
      t.decimal :deal_spare_64
      t.decimal :deal_spare_65

      t.datetime :deal_spare_66
      t.datetime :deal_spare_67
      t.datetime :deal_spare_68

      t.date :deal_spare_71
      t.date :deal_spare_72
      t.date :deal_spare_73

      t.timestamps
    end
  end
end
