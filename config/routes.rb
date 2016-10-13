Rails.application.routes.draw do
  root :to => "shipments#index"

  resources :documents

  resources :shipments
  post 'shipments/collate/:id', to: 'shipments#collate'
end
