Dashboard::Application.routes.draw do
  root "dashboard#index"

  namespace :api, path: "", contraints: { subdomain: "api" } do
    namespace :v0 do
      resources :sleeps
    end
  end
end
