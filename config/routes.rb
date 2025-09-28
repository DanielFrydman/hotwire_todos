# config/routes.rb
Rails.application.routes.draw do
  root 'todos#index'
  
  resources :todos do
    member do
      patch :toggle
    end
  end
end