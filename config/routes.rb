Rails.application.routes.draw do
  root "jobs#index"
  
  devise_for :users

  namespace :admin do
    resources :jobs do
      member do
        post :public
        post :hide
      end
      
      resources :resumes
    end
    
  end

  resources :jobs do
    resources :resumes
  end
end
