xml.instruct!

xml.urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9") do

  xml.url do
    xml.loc root_url
    xml.changefreq("daily")
    xml.priority "1.0"
  end
  
  @posts.each do |post|
    xml.url do
      xml.loc post_url(post)
      xml.changefreq("daily")
      xml.priority "0.8"
      xml.lastmod post.updated_at.strftime("%Y-%m-%dT%H:%M:%S.%2N%:z")
    end
  end

  @coupons.each do |coupon|
    xml.url do
      xml.loc coupon_url(coupon)
      xml.changefreq("daily")
      xml.priority "0.8"
      xml.lastmod coupon.updated_at.strftime("%Y-%m-%dT%H:%M:%S.%2N%:z")
    end
  end

  @bloggers.each do |blogger|
    xml.url do
      xml.loc blogger_url(blogger)
      xml.changefreq("daily")
      xml.priority "0.8"
      xml.lastmod blogger.updated_at.strftime("%Y-%m-%dT%H:%M:%S.%2N%:z")
    end
  end

  @hotdeals.each do |hotdeal|
    xml.url do
      xml.loc hotdeal_url(hotdeal)
      xml.changefreq("daily")
      xml.priority "0.8"
      xml.lastmod hotdeal.updated_at.strftime("%Y-%m-%dT%H:%M:%S.%2N%:z")
    end
  end

  @picks.each do |pick|
    xml.url do
      xml.loc pick_url(pick)
      xml.changefreq("daily")
      xml.priority "0.8"
      xml.lastmod pick.updated_at.strftime("%Y-%m-%dT%H:%M:%S.%2N%:z")
    end
  end

end