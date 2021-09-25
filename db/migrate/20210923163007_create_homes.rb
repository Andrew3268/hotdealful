class CreateHomes < ActiveRecord::Migration[6.1]
  def change
    create_table :homes do |t|
      t.integer :user_id
      t.string :main_title
      t.string :main_image
      t.string :main_link
      t.string :main_description

      t.string :sub_title_01
      t.string :sub_title_02
      t.string :sub_title_03
      t.string :sub_title_04
      t.string :sub_title_05

      t.string :sub_image_01
      t.string :sub_image_02
      t.string :sub_image_03
      t.string :sub_image_04
      t.string :sub_image_05

      t.string :sub_link_01
      t.string :sub_link_02
      t.string :sub_link_03
      t.string :sub_link_04
      t.string :sub_link_05

      t.decimal :sub_is_price_01
      t.decimal :sub_is_price_02
      t.decimal :sub_is_price_03
      t.decimal :sub_is_price_04
      t.decimal :sub_is_price_05

      t.decimal :sub_was_price_01
      t.decimal :sub_was_price_02
      t.decimal :sub_was_price_03
      t.decimal :sub_was_price_04
      t.decimal :sub_was_price_05

      t.decimal :sub_pct_01
      t.decimal :sub_pct_02
      t.decimal :sub_pct_03
      t.decimal :sub_pct_04
      t.decimal :sub_pct_05

      t.string :h_spare_01
      t.string :h_spare_02
      t.string :h_spare_03
      t.string :h_spare_04
      t.string :h_spare_05
      t.string :h_spare_06
      t.string :h_spare_07
      t.string :h_spare_08
      t.string :h_spare_09
      t.string :h_spare_10
      t.string :h_spare_11
      t.string :h_spare_12
      t.string :h_spare_13
      t.string :h_spare_14
      t.string :h_spare_15
    
      t.text :h_spare_31
      t.text :h_spare_32
       
      t.float :h_spare_41
      t.float :h_spare_42
      t.float :h_spare_43
      t.float :h_spare_44
      t.float :h_spare_45
     
      t.integer :h_spare_56
      t.integer :h_spare_57
      t.integer :h_spare_58
      t.integer :h_spare_59
      t.integer :h_spare_60

      t.decimal :h_spare_61
      t.decimal :h_spare_62
      t.decimal :h_spare_63
      t.decimal :h_spare_64
      t.decimal :h_spare_65

      t.datetime :h_spare_66
      t.datetime :h_spare_67
      t.datetime :h_spare_68

      t.date :h_spare_71
      t.date :h_spare_72
      t.date :h_spare_73

      t.timestamps
    end
  end
end
