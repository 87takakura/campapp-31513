Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"
  #post 'chats', to: 'chats#create'
  #get 'chats', to: 'chats#checked'
  
  resources :users 
    resources :campposts do
      resources :comments
      resources :chats
    end
   


  end