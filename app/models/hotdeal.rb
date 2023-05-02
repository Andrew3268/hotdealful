class Hotdeal < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags


  #for hashtag
  after_create do
    hotdeal = Hotdeal.find_by(id: self.id)
    dealhashtags = self.deal_hashtag.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    dealhashtags.uniq.map do |hashtag|
        tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
        hotdeal.tags << tag
    end
  end
  
  before_update do
    hotdeal = Hotdeal.find_by(id: self.id)
    hotdeal.tags.clear
    dealhashtags = self.deal_hashtag.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    dealhashtags.uniq.map do |hashtag|
        tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
        hotdeal.tags << tag
    end
  end

  #for search
  def self.search_by(search_term)
    where("LOWER(deal_title) LIKE :search_term", search_term: "%#{search_term.downcase}%")
  end 


end
