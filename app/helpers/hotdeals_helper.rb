module HotdealsHelper
  def render_with_dealhashtags(deal_hashtag)
    deal_hashtag.gsub(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/){|word| link_to word, "/hotdeals/dealhashtag/#{word.delete('#')}"}.html_safe
  end 
end
