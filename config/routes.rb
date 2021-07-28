Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

   devise_for :accounts, controllers: { omniauth_callbacks: 'accounts/omniauth_callbacks' }

  # devise_for :accounts, controllers: {omniauth_callbacks: "account#omniauth"}


  # working route for oauth

   #devise_for :accounts, controllers: {omniauth_callbacks: "omniauth#google_oauth2"}

  # devise_for :accounts, :controllers => { :omniauth_callbacks => "accounts/omniauth_callbacks" }

  get '/upload', to: 'images#new'

  post '/upload', to: 'images#create'


  resources :images, only: [:index, :show, :create]

  root "pages#home"

  #get '/@:username', to: 'users#show', as: :profile

  resources :comments

  resources :accounts do 
    resources :images
  end

  #resources :

  resources :images

  # resources :images do
  #   end

    #get "/auth/google_oauth2/callback", to: 'omniauth#google_oauth2'

end
