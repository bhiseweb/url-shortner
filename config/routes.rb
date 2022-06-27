Rails.application.routes.draw do
  resources :links
  devise_for :users

  get '/:token', to: "links#explore"
  root "links#index"
end
