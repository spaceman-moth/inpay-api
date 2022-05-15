Rails.application.routes.draw do
  namespace :api do
    resources :payments, only: [:index, :create, :show] do
      get :status
    end
  end
end
