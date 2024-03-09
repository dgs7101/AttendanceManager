Rails.application.routes.draw do
  namespace :admins do
    get 'attendance'
    get 'reports'
    get 'staff_managements'
    get 'vacations'
    resources :dashboards do
      collection do
        get :monthly_records
      end
    end
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
