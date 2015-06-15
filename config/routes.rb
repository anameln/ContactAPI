Api::Application.routes.draw do
  resources :users,
  only: [:index, :create, :show, :update, :destroy] do
    resources :contacts, only: [:index]
    resources :comments, only: [:index, :create, :destory]
  end
  resources :contacts, only: [:create, :show, :update, :destroy] do
    resources :comments, only: [:index, :create, :destory]  
  end

  resources :contact_shares, only: [:create, :destroy]

  # get 'users' => 'users#index'
  # post 'users' => 'users#create'
  # get 'users/new' => 'users#new'
  # get 'users/:id/edit' => 'users#edit'
  # get 'users/:id' => 'users#show'
  # patch 'users/:id' => 'users#update'
  # put 'users/:id' => 'users#update'
  # delete 'users/:id' => 'users#destroy'
end
