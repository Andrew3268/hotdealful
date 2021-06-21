Rails.application.routes.draw do
  resources :picks
  devise_for :users
  root 'posts#index'
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/posts/hashtag/:name', to: 'posts#hashtags'
  get '/picks/phashtag/:name', to:'picks#hashtags'

  get 'bridges/finder_detail'
  get 'bridges/about_us'
  get 'bridges/delete_old_post'
  get 'bridges/under_deal'
  get 'bridges/half_deal'
  get 'bridges/share_facebook'
  get 'bridges/share_ko'
end
