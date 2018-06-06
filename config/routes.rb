Rails.application.routes.draw do


  devise_for :users
    devise_scope :user do
      authenticated :user do
      #modify to set the right homepage
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :users
  resources :posts

  get "/topics/:topic/articles", to: "articles#index"
  resources :articles 

end