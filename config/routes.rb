Rails.application.routes.draw do
  # root to: 'search_entries#index'
  get 'search_entries/index', as: 'search'

  # get 'search_entries/index'
  resources :deals
  resources :homes
  resources :coupons
  resources :picks
  devise_for :users
  # root 'posts#index'
  # root 'bridges#finder_detail'
  # root 'coupons#index'
  # root 'homes#index'
  root 'bridges#new_coupon_section'
  # root 'bridges#home'
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sitemap, :only => :index
  get 'sitemap.xml', :controller => "sitemap", :action => "xml"
  # get '/sitemap' => 'sitemaps#index'

  get '/posts/hashtag/:name', to: 'posts#hashtags'
  get '/picks/phashtag/:name', to:'picks#hashtags'
  get '/coupons/chashtag/:name', to:'coupons#hashtags'

  get 'bridges/finder_detail'
  get 'bridges/about_us'
  get 'bridges/delete_old_post'
  get 'bridges/under_deal'
  get 'bridges/half_deal'
  get 'bridges/share_facebook'
  get 'bridges/share_ko'
  get 'bridges/new_under_deal'
  get 'bridges/new_half_deal'
  get 'bridges/delete_coupons'
  get 'bridges/delete_hotdeals'
  get 'bridges/delete_shoes'
  get 'bridges/random_deals'
  get 'bridges/admin_panel'
  get 'bridges/home'
  get 'bridges/only_coupon'
  get 'bridges/tem_index'
  get 'bridges/coupon_section'
  get 'bridges/deal_section'

  get 'bridges/new_coupon_section'



  get '/404' , to: 'errors#not_found'
  get '/422' , to: 'errors#unacceptable'
  get '/500' , to: 'errors#server_errors'
end
