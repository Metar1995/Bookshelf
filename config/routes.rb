Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :libraries do
  end
  post 'create_books', to: 'books#create_books'
  put 'update_book_attributes', to: 'books#update_book_attributes'
  delete 'delete_book', to: 'books#delete_book'
  get 'show_books', to: 'books#show_books'
  get 'book_info', to: 'books#book_info'
  get 'search_book', to: 'books#search_book'
  
end
