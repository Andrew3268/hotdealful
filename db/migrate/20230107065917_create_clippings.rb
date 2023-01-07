class CreateClippings < ActiveRecord::Migration[6.1]
  def change
    create_table :clippings do |t|
      t.integer :user_id
      t.string :cli_title
      t.string :cli_img
      t.string :cli_link
      t.string :cli_sub_title
      t.string :cli_categories
      t.decimal :cli_pct
      

      t.string :cli_spare_01
      t.string :cli_spare_02
      t.string :cli_spare_03
      t.string :cli_spare_04
      t.string :cli_spare_05
      
      t.float :cli_spare_41
      t.float :cli_spare_42
      
      t.integer :cli_spare_56
      t.integer :cli_spare_57

      t.decimal :cli_spare_61
      t.decimal :cli_spare_62
      

      t.timestamps
    end
  end
end
