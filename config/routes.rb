Rails.application.routes.draw do
  root "jobs#index"
  
  devise_for :users

  namespace :admin do
    resources :jobs
  end

  resources :jobs
end
