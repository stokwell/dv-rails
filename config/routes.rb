Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'

  root to: 'dashboard#index'

  devise_for :users, module: 'users',
              path: '/', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'registration'},
              controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get 'dashboard', to: 'dashboard#index'
  get 'dashboard/today', to: 'dashboard#today'
  get 'dashboard/yesterday', to: 'dashboard#yesterday'
  
  resources :quotes
  resources :sentences

  get 'user_input/translate', to: 'user_inputs#translate'

  namespace :api do
    post 'user_inputs', to: 'user_inputs#create'
  end

end
