Rails.application.routes.draw do
  root to: "home#index"

  resource :home, controller: "home" do
    get "search"
  end

  resources :products do
    get "search", on: :collection
  end
end
