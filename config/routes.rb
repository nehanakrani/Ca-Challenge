Rails.application.routes.draw do

  resources :users, only: [:create, :update, :index] do
    collection do
      post 'confirm'
      post 'login'
      post 'email_update'
    end
    resources :groups, only: [:create, :update, :index, :show]
  end

  post 'password/forgot', to: 'password#forgot'
  post 'password/reset', to: 'password#reset'
  put 'password/update', to: 'password#update'
  post 'groups/assign', to: 'members#create'
end