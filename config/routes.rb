Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :hours, only: [:create, :edit, :update, :destroy]
    resources :invoices
  end

end