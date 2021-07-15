Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/upload', to: 'images#new'

  post '/upload', to: 'images#create'

  resources :images, only: [:index, :show, :create]

  root to: "pages#home"
  #get '/@:username', to: 'users#show', as: :profile

  resources :images do
    resources :comments
  end

  resources :accounts do 
    resources :images
  end

  resources :images do
    end

end
