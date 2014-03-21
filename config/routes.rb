Freeak::Application.routes.draw do
  match '/users/create/:uuid', to: 'users#create', via: :post
  match '/users/get/:uuid', to: 'users#get', via: :get

  match '/users/device/info/:uuid', to: 'devices#info', via: :get
  match '/users/device/info/:uuid/:guid/:type', to: 'devices#type_info', via: :get
  match '/users/device/authorized/:uuid/:guid', to: 'devices#authorized', via: :get
  match '/users/device/register/:uuid/:guid', to: 'devices#register', via: :post
  match '/users/device/unregister/:uuid/:guid', to: 'devices#unregister', via: :post

  match '/users/receivers/:uuid/:receiver_id', to: 'receivers#update', via: :post
  match '/users/receivers/:uuid/:receiver_id', to: 'receivers#get', via: :get

  match '/users/services/:uuid/:receiver_id', to: 'services#update', via: :post
  match '/users/services/:uuid/:receiver_id', to: 'services#get', via: :get

  match '/users/watchlist/:uuid/:tms_id', to: 'watchlist#update', via: :post
  match '/users/watchlist/:uuid', to: 'watchlist#get', via: :get
  match '/users/watchlist/:uuid/:tms_id', to: 'watchlist#get_by_tms_id', via: :get
  match '/users/watchlist/:uuid/:tms_id', to: 'watchlist#delete', via: :delete

  match '/users/recent/:uuid/:tms_id', to: 'recent#update', via: :post
  match '/users/recent/:uuid', to: 'recent#get', via: :get
  match '/users/recent/:uuid/:tms_id', to: 'recent#get_by_tms_id', via: :get
  match '/users/recent/:uuid', to: 'recent#delete', via: :delete
  match '/users/recent/:uuid/:tms_id', to: 'recent#delete_by_tms_id', via: :delete

  match '/users/progress/:uuid/:tms_id/:position', to: 'progress#update', via: :post
  match '/users/progress/:uuid', to: 'progress#get', via: :get
  match '/users/progress/:uuid/:tms_id', to: 'progress#get_by_tms_id', via: :get
  match '/users/progress/:uuid/:tms_id', to: 'progress#delete', via: :delete

  get 'bogus/index'
  root 'bogus#index'
end
