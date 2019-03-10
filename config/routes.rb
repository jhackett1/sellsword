Rails.application.routes.draw do
  devise_for :users
  root 'projects#index'

  resources :projects do
    resources :hours, only: [:create, :edit, :update, :destroy]
    resources :invoices
    get '/invoices/:id/pdf', to: 'invoices#pdf'
  end

end