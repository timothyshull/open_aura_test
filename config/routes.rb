Rails.application.routes.draw do
  root                    'particles#index'
  resources :particles,    only: [:index]
end
