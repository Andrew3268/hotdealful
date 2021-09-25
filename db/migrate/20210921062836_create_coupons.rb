class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.integer :user_id
      t.string :c_title
      t.string :c_link
      t.string :c_image
      t.string :c_source
      t.string :c_hashtag
      t.string :c_promocode
      t.string :c_rating
      t.string :c_review_count
      t.decimal :c_is_price
      t.decimal :c_was_price
      t.decimal :c_pct
      t.text :c_description

      t.string :c_spare_01
      t.string :c_spare_02
      t.string :c_spare_03
      t.string :c_spare_04
      t.string :c_spare_05
      t.string :c_spare_06
      t.string :c_spare_07
      t.string :c_spare_08
      t.string :c_spare_09
      t.string :c_spare_10
      t.string :c_spare_11
      t.string :c_spare_12
      t.string :c_spare_13
      t.string :c_spare_14
      t.string :c_spare_15
    
      t.text :c_spare_31
      t.text :c_spare_32
       
      t.float :c_spare_41
      t.float :c_spare_42
      t.float :c_spare_43
      t.float :c_spare_44
      t.float :c_spare_45
     
      t.integer :c_spare_56
      t.integer :c_spare_57
      t.integer :c_spare_58
      t.integer :c_spare_59
      t.integer :c_spare_60

      t.decimal :c_spare_61
      t.decimal :c_spare_62
      t.decimal :c_spare_63
      t.decimal :c_spare_64
      t.decimal :c_spare_65

      t.datetime :c_spare_66
      t.datetime :c_spare_67
      t.datetime :c_spare_68

      t.date :c_spare_71
      t.date :c_spare_72
      t.date :c_spare_73

      t.timestamps
    end
  end
end
