class CreateSavings < ActiveRecord::Migration[6.1]
  def change
    create_table :savings do |t|
      t.integer :user_id
      t.string :s_title
      t.string :s_link
      t.string :s_image
      t.string :s_promocode
      t.float :s_rating
      t.integer :s_rating_code
      t.float :s_review_count
      t.decimal :s_is_price
      t.decimal :s_was_price
      t.decimal :s_pct
      t.decimal :s_cash_coupon
      t.decimal :s_pct_coupon
      t.text :s_description

      t.string :s_spare_01
      t.string :s_spare_02
      t.string :s_spare_03
      t.string :s_spare_04
      t.string :s_spare_05
      
      t.float :s_spare_41
      t.float :s_spare_42
      
      t.integer :s_spare_56
      t.integer :s_spare_57

      t.decimal :s_spare_61
      t.decimal :s_spare_62
      
      t.datetime :s_spare_66
      t.datetime :s_spare_67
      
      t.date :s_spare_71
      t.date :s_spare_72     

      t.timestamps
    end
  end
end
