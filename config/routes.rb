Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'
  
  devise_for :users, module: 'users', path: '/', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'registration'}

  resources :dashboard

  root to: 'dashboard#index'

  namespace :api do
    post 'user_inputs', to: 'user_inputs#create'
  end

  # scope :api, path: 'api' do
  #   devise_for :users, controllers: {
  #     registrations: 'api/users/registrations',
  #   }
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
