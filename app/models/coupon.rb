class Coupon < ApplicationRecord
  extend FriendlyId
  friendly_id :c_title, use: :slugged

  
  belongs_to :user
  has_and_belongs_to_many :tags
  validates :c_was_price, presence: true


  after_create do
    coupon = Coupon.find_by(id: self.id)
    chashtags = self.c_hashtag.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    chashtags.uniq.map do |hashtag|
        tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
        coupon.tags << tag
    end
  end
  
  before_update do
    coupon = Coupon.find_by(id: self.id)
    coupon.tags.clear
    chashtags = self.c_hashtag.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    chashtags.uniq.map do |hashtag|
        tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
        coupon.tags << tag
    end
  end

  def self.search_by(search_term)
    where("LOWER(c_title) LIKE :search_term", search_term: "%#{search_term.downcase}%")
  end 

    
end
