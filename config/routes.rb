Rails.application.routes.draw do
  resources :sample_actions
  # resources :authorized_services
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'application#hello'
  # put 'authorized_services', to: 'authorized_services#update'
  # delete 'authorized_services', to: 'authorized_services#destroy'
  mount Clientoken::Engine, at: "/clientoken"
end
