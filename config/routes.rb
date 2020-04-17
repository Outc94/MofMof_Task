Rails.application.routes.draw do
  root 'properties#index'
  resources :stations
  resources :properties
end
