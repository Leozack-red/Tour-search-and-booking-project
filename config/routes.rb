Rails.application.routes.draw do
  root 'activities#index'
  resources :activities, only: %i[index show]
  resources :cities, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
