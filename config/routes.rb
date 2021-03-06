Rails.application.routes.draw do
  resources :taggings
  resources :tags
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :episodes do
    collection do
      patch :update_many
    end
  end
  get 'new', to: 'episodes#new'
  root to: 'episodes#index'
end
