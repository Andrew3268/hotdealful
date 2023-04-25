class Blog < ApplicationRecord

  belongs_to :user
  
  has_rich_text :blog_content_01
  has_rich_text :blog_content_02
  has_rich_text :blog_content_03
  has_rich_text :blog_content_04
  has_rich_text :blog_content_05
  has_rich_text :blog_content_06
  has_rich_text :blog_content_07
end
