Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  match 'pubsubhubbub/post', to: 'youtube_webhook_verifications#create', via: [:get, :post]

  namespace :control_panel, path: 'controlpanel' do
    resources :channels, only: :show do
      resource :suspension, only: :create, module: :channels
    end
    resources :videos, only: [:show, :edit, :update]
  end

  namespace :sites_setup, path: 'sites/:site_id/welcome' do
    resource :details, only: [:edit, :update], path: 'your-site'
    resource :users, only: [:new, :create], path: 'account'
  end

  resources :sites, only: [:create, :show]
  resources :channels, only: [:show, :edit, :update]
  resources :notification_subscriptions, only: [:create]
  delete :notification_subscriptions, to: 'notification_subscriptions#destroy'

  root 'static#home_page'
end
