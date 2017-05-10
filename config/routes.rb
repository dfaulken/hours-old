Rails.application.routes.draw do
  root 'shifts#index'
  resources :shifts, only: %i[create destroy index update]
end
