Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do
      # login and logout
      post    'sessions',           to: 'sessions#authenticate_user',             as: 'login_user'
      delete  'sessions',           to: 'sessions#logout_user',                   as: 'logout_user'
      # user
      post    'users',              to: 'users#create_user',                      as: 'create_user'
      put     'users',              to: 'users#update_user',                      as: 'update_user'
      # transport fare
      post    'transport_fares',    to: 'transport_fares#compare_location',       as: 'compare_location'
      get     'transport_fares',    to: 'transport_fares#show_transport_fare',    as: 'show_transport_fare'
      get     'transport_fares',    to: 'transport_fares#get_transport_fare',     as: 'get_transport_fare'
      # trip transaction
      get     'trip_transactions',  to: 'trip_transactions#get_transaction',      as: 'get_transaction'
      post    'trip_transactions',  to: 'trip_transactions#create_transaction',   as: 'create_transaction'
    end
  end

  get   'admin/:username',          to: 'admins#view'

  # admin login
  get   'login',                    to: 'admins#login'
  post  'login',                    to: 'admins#authenticate'
  get   'logout',                   to: 'admins#destroy_session'
  get   'index',                    to: 'admins#index'

  # views => users
  get   'view_user',                to: 'users#view_user'

  # views => trip transactions
  get   'view_trip_transaction',    to: 'trip_transactions#view_trip_transaction'
  
  # views => transport fares
  get   'view_transport_fare',      to: 'transport_fares#view_transport_fare'
  get   'edit_transport_fare',      to: 'transport_fares#edit_transport_fare'
  patch 'update_transport_fare',    to: 'transport_fares#update_transport_fare'
  put   'update_transport_fare',    to: 'transport_fares#update_transport_fare'
  post  'update_transport_fare',    to: 'transport_fares#update_transport_fare'

  root  'admins#index'
end
