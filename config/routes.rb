Rails.application.routes.draw do
  devise_scope :user do
    root :to => "devise/sessions#new"
  end
  get 'user/:id' => "users#show"
  resources :tasks

  devise_for :users

end
