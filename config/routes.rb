Rails.application.routes.draw do

  namespace :admin do
    root :to => 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :tags, only: [:index, :new, :create, :edit, :update]
    resources :articles, only: [:index, :new, :create, :show, :edit, :update]
    patch 'articles/:id/withdraw' => 'articles#withdraw'
  end

  scope module: :public do
    root :to => 'homes#top'
    get 'customers/my_page' => 'customers#show'
    get 'customers/my_page/edit' => 'customers#edit'
    patch 'customers/my_page/update' => 'customers#update'
    get 'customers/confirm' => 'customers#confirm'
    patch 'customers/withdraw' => 'customers#withdraw'
    resources :articles, only: [:index, :show]
  end

  devise_for :customers, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
