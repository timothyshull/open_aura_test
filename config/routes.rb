Rails.application.routes.draw do
  # The logic behind this is to limit the app to a single page resource, switched by the controller from the empty index to the index showing particles
  root                    'particles#index'
  resources :particles,    only: [:index]
end
