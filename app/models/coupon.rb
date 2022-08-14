class Coupon < ApplicationRecord
  include Searchable

  after_commit :create_search_entry, on: :create
  after_commit :update_search_entry, on: :update
  after_commit :destroy_search_entry, on: :destroy

  private

    def create_search_entry
      SearchEntry.create(title: self.c_title, 
                         link: self.c_link, 
                         image: self.c_image, 
                         source: self.c_source, 
                         hashtag: self.c_hashtag, 
                         promocode: self.c_promocode, 
                         rating: self.c_rating, 
                         review_count: self.c_review_count, 
                         rating_code: self.c_spare_58, 
                         is_price: self.c_is_price, 
                         was_price: self.c_was_price,
                         pct: self.c_pct, 
                         pct_coupon: self.c_spare_61,
                         cash_coupon: self.c_spare_62,
                         description: self.c_description, 
                         searchable: self)
    end

    def update_search_entry
      self.search_entry.update(title: self.c_title, 
                               link: self.c_link, 
                               image: self.c_image, 
                               source: self.c_source, 
                               hashtag: self.c_hashtag, 
                               promocode: self.c_promocode, 
                               rating: self.c_rating, 
                               review_count: self.c_review_count, 
                               rating_code: self.c_spare_58, 
                               is_price: self.c_is_price, 
                               was_price: self.c_was_price,
                               pct: self.c_pct, 
                               pct_coupon: self.c_spare_61,
                               cash_coupon: self.c_spare_62,
                               description: self.c_description) if self.search_entry.present?
    end

    def destroy_search_entry
      self.search_entry.destroy if self.search_entry.present?
    end    

  acts_as_punchable
  
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
