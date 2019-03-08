Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :hours, only: [:create, :edit, :update, :destroy]
  end

end