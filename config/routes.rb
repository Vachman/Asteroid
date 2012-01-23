Asteroid::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :directions

  resources :regions

  resources :phone_codes

  resources :contexts do
    resources :context_rules
  end

  resources :clients
   
  
  resources :phones
  root :to => "sip_accounts#index"
  
  #Authentication
# match 'users/sign_up' => 'sip_accounts#index'
# devise_for :users, ActiveAdmin::Devise.config

  resources :sip_accounts
      
  match 'sip_accounts/:id/toggle_lock' => 'sip_accounts#toggle_lock', :as => :toggle_lock
  match 'sip_accounts/:id/toggle_on_off' => 'sip_accounts#toggle_on_off', :as => :toggle_on_off
  
end