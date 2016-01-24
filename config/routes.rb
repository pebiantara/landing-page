Rails.application.routes.draw do
  root 'home#index'

  resources :subscriptions, only: [:create]
  match "/:page_id" => 'pages#show', as: :show_page, via: [:get]
end
