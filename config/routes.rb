Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy', as: 'destroy_user_session_via_get'
  end

  get 'books/index'
  get 'books/edit'
  get 'books/create'
  get 'books/search'
  get 'books/delete'
  get 'books/new'
  get 'books/update'
  get 'books/destroy'
  get 'books/show'

 

 

  get "reviews/new", to: "reviews#new"
  get "/books/reviews/:id", to: "reviews#create"
  delete "books/reviews/:book_id/:id", to: "reviews#destroy"
  get ":book_id/reviews/:id/edit", to: "reviews#edit", as: :review_edit
  patch "/books/:book_id/reviews/:id/books/reviews", to: "reviews#update"


  root 'books#index'
  resources :users
  resources :books do 
  resources :reviews
  collection do
    get 'search'
  end
  end 
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

