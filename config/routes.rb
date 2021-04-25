Rails.application.routes.draw do

  get 'camppostsearches/index'
  get 'camppostsearches/search'
  devise_for :users
  root to: "home#index"
  #post 'chats', to: 'chats#create'
  #get 'chats', to: 'chats#checked'
  
  resources :users 
    resources :campposts do
      resources :comments
      resources :chats
    end
    
    resources :camppostsearches  
 

  end