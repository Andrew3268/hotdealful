class Blogger < ApplicationRecord
  acts_as_punchable

  has_and_belongs_to_many :tags
  belongs_to :user
  
  has_rich_text :bl_content_01
  has_rich_text :bl_content_02
  has_rich_text :bl_content_03
  has_rich_text :bl_content_04
  has_rich_text :bl_content_05
  has_rich_text :bl_content_06
  has_rich_text :bl_content_07


  #for hashtag
  after_create do
    blogger = Blogger.find_by(id: self.id)
    bloghashtags = self.bl_category.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    bloghashtags.uniq.map do |hashtag|
        tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
        blogger.tags << tag
    end
  end
  
  before_update do
    blogger = Blogger.find_by(id: self.id)
    blogger.tags.clear
    bloghashtags = self.bl_category.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    bloghashtags.uniq.map do |hashtag|
        tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
        blogger.tags << tag
    end
  end

  #for search
  def self.search_by(search_term)
    where("LOWER(bl_title) LIKE :search_term", search_term: "%#{search_term.downcase}%")
  end 
end
