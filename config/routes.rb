Rails.application.routes.draw do

  resources :companies, only: %w[create index]


  root to: 'static#index'
end
