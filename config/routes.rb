Rails.application.routes.draw do
  
  authenticate :user, lambda { |u| u.admin? } do
    begin
      mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    rescue
      redirect_to new_user_session_path
    end
  end

  
  devise_for :users
  root 'posts#index'
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/posts/hashtag/:name', to: 'posts#hashtags'

  get 'bridges/finder_detail'
  get 'bridges/about_us'
end
