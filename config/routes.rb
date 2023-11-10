Rails.application.routes.draw do
  resources :admins
  resources :users
  resources :especialidades, only: [:index, :show]
end
