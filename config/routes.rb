Rails.application.routes.draw do
  resources :bikes, only: [:index, :show, :create]
  resources :zipcodes, only: [:index, :show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
