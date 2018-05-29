Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do
      post    'sessions', to: 'sessions#authenticate_user', as: 'login_user'
      delete  'sessions', to: 'sessions#logout_user',       as: 'logout_user'
      post    'users',    to: 'users#create_user',          as: 'create_user'
      resources :transport_fares
    end
  end

  get   'admin/:username',        to: 'admins#view'

  # admin login
  get   'login',                  to: 'admins#login'
  post  'login',                  to: 'admins#authenticate'
  get   'logout',                 to: 'admins#destroy_session'
  get   'index',                  to: 'admins#index'

  # views => users
  get   'view_user',              to: 'users#view_user'
  # views => trip transactions
  get   'view_trip_transaction',  to: 'trip_transactions#view_trip_transaction'
  # views => transport fares
  get   'view_transport_fare',    to: 'transport_fares#view_transport_fare'
  get   'edit_transport_fare',    to: 'transport_fares#edit_transport_fare'
  patch 'update_transport_fare',  to: 'transport_fares#update_transport_fare'
  put   'update_transport_fare',  to: 'transport_fares#update_transport_fare'
  post  'update_transport_fare',  to: 'transport_fares#update_transport_fare'

  root  'admins#index'
end
