class Post < ApplicationRecord
  include Searchable

  after_commit :create_search_entry, on: :create
  after_commit :update_search_entry, on: :update
  after_commit :destroy_search_entry, on: :destroy

  private

    def create_search_entry
      SearchEntry.create(title: self.title, 
                         link: self.link, 
                         image: self.image, 
                         source: self.source, 
                         hashtag: self.hashtag, 
                         promocode: self.promocode, 
                         rating: self.rating, 
                         review_count: self.review_count, 
                         rating_code: self.spare_56, 
                         is_price: self.is_price, 
                         was_price: self.was_price,
                         pct: self.pct, 
                         pct_coupon: self.spare_61,
                         cash_coupon: self.spare_62,
                         description: self.description,
                         searchable: self)
    end

    def update_search_entry
      self.search_entry.update(title: self.title, 
                               link: self.link, 
                               image: self.link, 
                               source: self.source, 
                               hashtag: self.hashtag, 
                               promocode: self.promocode, 
                               rating: self.rating, 
                               review_count: self.review_count, 
                               rating_code: self.spare_56, 
                               is_price: self.is_price, 
                               was_price: self.was_price,
                               pct: self.pct, 
                               pct_coupon: self.spare_61,
                               cash_coupon: self.spare_62,
                               description: self.description) if self.search_entry.present?
    end

    def destroy_search_entry
      self.search_entry.destroy if self.search_entry.present?
    end


  acts_as_punchable
    
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_and_belongs_to_many :tags

  validates :was_price, presence: true

  belongs_to :user


  after_create do
    post = Post.find_by(id: self.id)
    hashtags = self.hashtag.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    hashtags.uniq.map do |hashtag|
        tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
        post.tags << tag
    end
  end
  
  before_update do
    post = Post.find_by(id: self.id)
    post.tags.clear
    hashtags = self.hashtag.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    hashtags.uniq.map do |hashtag|
        tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
        post.tags << tag
    end
  end

  def self.search_by(search_term)
    where("LOWER(title) LIKE :search_term", search_term: "%#{search_term.downcase}%")
  end 

end
