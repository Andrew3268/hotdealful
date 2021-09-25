module CouponsHelper
  def render_with_chashtags(c_hashtag)
    c_hashtag.gsub(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/){|word| link_to word, "/coupons/chashtag/#{word.delete('#')}"}.html_safe
  end 
end
