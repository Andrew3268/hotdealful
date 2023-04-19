class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :blog_m_title
      t.text :blog_m_description

      t.string :blog_subtitle_01      
      t.string :blog_subtitle_02
      t.string :blog_subtitle_03
      t.string :blog_subtitle_04
      t.string :blog_subtitle_05
      t.string :blog_subtitle_06
      t.string :blog_subtitle_07

      t.string :blog_image_01
      t.string :blog_image_02
      t.string :blog_image_03
      t.string :blog_image_04
      t.string :blog_image_05
      t.string :blog_image_06
      t.string :blog_image_07

      t.string :blog_link_01
      t.string :blog_link_02
      t.string :blog_link_03
      t.string :blog_link_04
      t.string :blog_link_05
      t.string :blog_link_06
      t.string :blog_link_07


      t.timestamps
    end
  end
end
