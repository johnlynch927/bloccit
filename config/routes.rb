Bloccit::Application.routes.draw do

  get "users/index"

  get "posts/index"

  get "comments/create"


  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  resources :users, only: [:show, :index]

  # create a route for users#show


  resources :posts, only: [:index]
  resources :topics do
     resources :posts, except: [:index], controller: 'topics/posts' do
      resources :comments, only: [:create, :destroy]
        match '/up-vote', to: 'votes#up_vote', as: :up_vote
        match '/down-vote', to: 'votes#down_vote', as: :down_vote
      resources :favorites, only: [:create, :destroy]
    end
  end   

  match "about" => 'welcome#about', via: :get
  # what is this line all about  match "about" => 'welcome#about', via: :get 
  # is it because the about action dosen't have any parameters so when you see about just go straight to the about view?

  root :to => 'welcome#index'
end 


