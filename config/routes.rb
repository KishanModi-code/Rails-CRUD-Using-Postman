Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :posts do
    end
  end
  
  resources :posts, only: [:index, :show, :create, :update, :destroy] do
    collection do
      get 'all', action: 'all'
    end
  end
end


