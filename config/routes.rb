Rails.application.routes.draw do
  root 'shifts#index'
  resources :shifts, only: %i[create destroy index update] do
    collection do
      post :initialize_week
    end
  end
end
