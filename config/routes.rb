# config/routes.rb
Rails.application.routes.draw do

  scope :api do
    resources :todos
    post '/login', to: 'authentication#authenticate'
    post '/signup', to: 'users#create'
  end


end