class CreateDeals < ActiveRecord::Migration[6.1]
  def change
    create_table :deals do |t|
      t.integer :user_id
      t.string :d_title
      t.string :d_image
      t.string :d_link
      t.string :d_source
      t.decimal :d_price

      t.string :d_spare_01
      t.string :d_spare_02
      t.string :d_spare_03
      t.string :d_spare_04
      t.string :d_spare_05
      t.string :d_spare_06
      t.string :d_spare_07
      t.string :d_spare_08
      t.string :d_spare_09
      t.string :d_spare_10
    
      t.text :d_spare_31
      t.text :d_spare_32
       
      t.float :d_spare_41
      t.float :d_spare_42
      t.float :d_spare_43      
     
      t.integer :d_spare_56
      t.integer :d_spare_57
      t.integer :d_spare_58

      t.decimal :d_spare_61
      t.decimal :d_spare_62
      t.decimal :d_spare_63

      t.datetime :d_spare_66
      t.datetime :d_spare_67

      t.date :d_spare_71
      t.date :d_spare_72
      
      t.timestamps
    end
  end
end
