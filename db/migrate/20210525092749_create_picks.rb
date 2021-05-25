class CreatePicks < ActiveRecord::Migration[6.1]
  def change
    create_table :picks do |t|
      t.integer :user_id
      t.string :p_title
      t.string :p_image
      t.string :p_link
      t.string :p_hashtag

      t.string :p_spare_01
      t.string :p_spare_02
      t.string :p_spare_03
      t.string :p_spare_04
      t.string :p_spare_05
      
      t.text :p_spare_31
      t.text :p_spare_32
      
      t.timestamps
    end
  end
end
