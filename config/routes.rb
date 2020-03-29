Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
  root "products#index"

  devise_scope :user do
    get "/users/sign_out", to: "devise/sessions#destroy" 
  end

  resources :signup do
    collection do
      get 'register_user_info'
      post 'register_cellphone'
      post 'register_address'
      post 'register_card', to: "signup#register_card"
      post 'signup', to: 'signup#create'
      get 'complete_registration'
    end
  end

  resources :products, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    collection do
      get :completion
      get :exhibiting
      get :trading
      get :sold
      get :purchase
      get :purchased
      get :search
      get :buy
    end

    member do
      put :stop_selling
      put :reselling
    end
    resources :purchase, only: [:index] do
      collection do
        post :purchase
        get :purchased
      end
    end

    resources :comments, only: [:create, :destroy]
  end

  resources :categories, only: [:index, :show]

  resources :users, only: [:index, :edit, :update] do
    collection do
      get :identification
      get :change_password
      get :check_cellphone
      get :change_address
      get :logout
      get :card 
      get :register_card
      post :create_card
      delete :delete_card
    end
  end

end
