Dashboard::Application.routes.draw do
  root "dashboard#index"

  namespace :api, path: "", constraints: { subdomain: "api" } do
    namespace :v0 do
      resources :users
      resources :sleeps
      resources :steps
      resources :calories
      resources :moods
      resources :weights
      resources :pulses
    end
  end
end
