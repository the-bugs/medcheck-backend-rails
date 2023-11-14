Rails.application.routes.draw do
  resources :admins
  resources :users
  resources :especialidades, only: [:index, :show]
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
