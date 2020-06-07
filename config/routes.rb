Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies do
    resources :reviews, except: [:show, :index]
  end

  root 'movies#index'
end
