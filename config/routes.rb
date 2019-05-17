Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'tags/:tag', to: 'jobs#index', as: :tag
  resources :jobs
  root to: "jobs#index"
end
