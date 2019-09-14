Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :books
      resources :authors
      delete '/books/delete-all/:ids', to: 'books#destroy_books', as: 'delete_books'
      resources :book_genres
      resources :genres
    end
  end

  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  post 'signup', controller: :signup, action: :create
  delete 'signin', controller: :signin, action: :destroy
end
