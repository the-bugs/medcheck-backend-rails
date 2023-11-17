Rails.application.routes.draw do
  resources :appointments
  resources :schedules
  resources :specialties
  resources :medics
  resources :records
  resources :patients
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
