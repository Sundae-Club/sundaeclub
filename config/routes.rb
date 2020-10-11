Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :control_panel, path: 'controlpanel' do
    resources :channels, only: :show do
      resource :suspension, only: :create, module: :channels
    end
  end

  resources :channels, only: [:show, :edit, :update]
end
