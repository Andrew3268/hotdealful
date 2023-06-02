Rails.application.routes.draw do


  resources :hotdeals
  resources :bloggers
  resources :blogs
  # root 'blogs#index'
  resources :clippings
  resources :savings
  resources :onedays
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


  root 'bloggers#index' #########  

  # root 'bridges#home'
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sitemap, :only => :index
  get 'sitemap.xml', :controller => "sitemap", :action => "xml"
  # get '/sitemap' => 'sitemaps#index'

  get '/posts/hashtag/:name', to: 'posts#hashtags'
  get '/picks/phashtag/:name', to:'picks#hashtags'
  get '/coupons/chashtag/:name', to:'coupons#hashtags'
  get '/hotdeals/dealhashtag/:name', to:'hotdeals#hashtags'
  get '/bloggers/bloghashtag/:name', to:'bloggers#hashtags'

  get 'bridges/finder_detail'#active
  get 'bridges/about_us'#active
  get 'bridges/delete_coupons' #active
  get 'bridges/delete_hotdeals' #active
  get 'bridges/only_coupon' #active
  get 'bridges/policy' #active
  get 'bridges/trending_coupon' #active
  get 'bridges/testing' #active
  get 'bridges/reviews' #active


  get 'bridges/new_coupon_section'



  get '/404' , to: 'errors#not_found'
  get '/422' , to: 'errors#unacceptable'
  get '/500' , to: 'errors#server_errors'
end
