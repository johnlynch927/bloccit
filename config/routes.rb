Bloccit::Application.routes.draw do

  get "comments/create"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :topics do
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]
    end
  end 


# what is this line all about except: [:index]

  match "about" => 'welcome#about', via: :get
  # what is this line all about  match "about" => 'welcome#about', via: :get 
  # is it because the about action dosen't have any parameters so when you see about just go straight to the about view?

  root :to => 'welcome#index'
end 


