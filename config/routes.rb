Rails.application.routes.draw do
  devise_for :users
  resources :tweets do
    member do
      get :like
    end
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tweets#index"
end
