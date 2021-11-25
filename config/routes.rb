Rails.application.routes.draw do
  resources :homes
  resources :coupons
  resources :picks
  devise_for :users
  # root 'posts#index'
  # root 'bridges#finder_detail'
  # root 'coupons#index'
  root 'homes#index'
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
  get 'bridges/new_index'
  get 'bridges/new_under_deal'
  get 'bridges/new_half_deal'
  get 'bridges/delete_coupons'
  get 'bridges/delete_hotdeals'


  get '/404' , to: 'errors#not_found'
  get '/422' , to: 'errors#unacceptable'
  get '/500' , to: 'errors#server_errors'
end
