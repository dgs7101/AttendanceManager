Rails.application.routes.draw do
  namespace :admins do
    resources :dashboards
    root to: 'dashboards#index'
  end
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  resources :time_records do
    collection do
      post :check_in
      post :check_out
    end
  end
  root to: 'time_records#index'
end
