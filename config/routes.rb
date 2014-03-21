Freeak::Application.routes.draw do
  get "receivers/get"
  get "receivers/update"
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



  get 'bogus/index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'bogus#index'

end
