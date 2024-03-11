Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  namespace :admins do
    root to: 'dashboards#index'
    get 'attendance', to: 'attendance#index'
    get 'reports', to: 'reports#index'
    get 'staff_managements', to: 'staff_managements#index'
    get 'vacations', to: 'vacations#index'
    resources :dashboards
  end

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  namespace :users do
    root to: 'time_records#index'
    resources :time_records do
      collection do
        post :check_in
        post :check_out
      end
    end
  end
  root 'pages#home'
end
