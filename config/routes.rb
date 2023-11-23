Rails.application.routes.draw do
  resources :appointments, path: :consultas
  resources :schedules, path: :agendas
  resources :specialties, path: :especialidades
  resources :medics, path: :medicos
  resources :records, path: :prontuarios
  resources :patients, path: :pacientes
  resources :users, path: :usuarios

  get '/medicos/especialidades/:id', to: 'medics#medics_by_specialty'
  get '/agendas/medicos/:id', to: 'schedules#schedules_by_medics'
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
