Rails.application.routes.draw do
  devise_for :users
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  get 'books/create'
  get 'books/search'
  get 'books/delete'
  get 'books/new'
  get 'books/update'
  get 'books/destroy'


 

  get "reviews/new", to: "reviews#new"
  post "reviews", to: "reviews#create"

  root 'books#index'
  resources :books do 
  resources :reviews
  collection do
    get 'search'
  end
  end 
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
