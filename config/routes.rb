# config/routes.rb
Rails.application.routes.draw do

  scope :api do
    resources :todos
    post '/login', to: 'authentication#authenticate'
    delete 'logout', to: 'authentication#destroy'
    post '/signup', to: 'users#create'
  end


end