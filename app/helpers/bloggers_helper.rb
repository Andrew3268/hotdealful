module BloggersHelper
  def render_with_bloghashtags(bl_category)
    bl_category.gsub(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/){|word| link_to word, "/bloggers/bloghashtag/#{word.delete('#')}"}.html_safe
  end 
end
