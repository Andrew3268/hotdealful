module PicksHelper
  def render_with_phashtags(p_hashtag)
    p_hashtag.gsub(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/){|word| link_to word, "/picks/phashtag/#{word.delete('#')}"}.html_safe
  end 
end
