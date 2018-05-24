Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :docs #for creating resources for Docs model

  authenticated :user do
  	root "docs#index", as: "aunthenticated_root"
  end

  root 'welcome#index' #To make welcome/index as default of the website
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
