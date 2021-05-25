class Pick < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags

  after_create do
    pick = Pick.find_by(id: self.id)
    phashtags = self.p_hashtag.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    phashtags.uniq.map do |hashtag|
        tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
        pick.tags << tag
    end
  end
  
  before_update do
    pick = Pick.find_by(id: self.id)
    pick.tags.clear
    phashtags = self.p_hashtag.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    phashtags.uniq.map do |hashtag|
        tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
        pick.tags << tag
    end
  end
end
