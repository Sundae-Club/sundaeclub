Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :control_panel, path: 'controlpanel' do
    resources :channels, only: :show do
      resource :suspension, only: :create, module: :channels
    end
  end

  namespace :sites_setup, path: 'sites/:site_id/welcome' do
    resource :details, only: [:edit, :update], path: 'your-site'
    resource :users, only: [:new, :create], path: 'account'
  end

  resources :sites, only: [:create, :show]
  resources :channels, only: [:show, :edit, :update]

  root 'static#home_page'
end
