Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "pages#home"

  resources :restaurants do
    resources :dishes
  end

  resources :dish, only: [] do
    resources :dish_ingredients
  end

  get 'restaurants/:restaurant_id/downloadQr', as: :download, to: 'restaurants#downloadqr'
end
