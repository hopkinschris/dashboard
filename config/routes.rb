Dashboard::Application.routes.draw do
  root "dashboard#index"

  namespace :api, path: "", contraints: { subdomain: "api" } do
    namespace :v0 do
      resources :users
      resources :sleeps
      resources :steps
      resources :calories
      resources :moods
    end
  end
end
