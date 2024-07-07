Rails.application.routes.draw do
  devise_for :users
  resources :tasks do
    member do
      patch :mark_complete
    end
  end
  root to: 'tasks#index'

  namespace :api do
    namespace :v1 do
      post '/max_sum', to: 'subarrays#max_sum'
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
