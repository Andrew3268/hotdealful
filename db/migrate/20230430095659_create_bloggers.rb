class CreateBloggers < ActiveRecord::Migration[6.1]
  def change
    create_table :bloggers do |t|
      t.integer :user_id
      t.string :bl_title
      t.string :bl_image
      t.string :bl_category
      t.text :bl_description

      t.text :bl_content_01
      t.text :bl_content_02
      t.text :bl_content_03
      t.text :bl_content_04
      t.text :bl_content_05
      t.text :bl_content_06
      t.text :bl_content_07

      t.string :bl_subtitle_01      
      t.string :bl_subtitle_02
      t.string :bl_subtitle_03
      t.string :bl_subtitle_04
      t.string :bl_subtitle_05
      t.string :bl_subtitle_06
      t.string :bl_subtitle_07

      t.string :bl_image_01
      t.string :bl_image_02
      t.string :bl_image_03
      t.string :bl_image_04
      t.string :bl_image_05
      t.string :bl_image_06
      t.string :bl_image_07

      t.string :bl_link_01
      t.string :bl_link_02
      t.string :bl_link_03
      t.string :bl_link_04
      t.string :bl_link_05
      t.string :bl_link_06
      t.string :bl_link_07

      t.timestamps
    end
  end
end
