Heedfeed::Application.routes.draw do
  resources :feeds, except: :index do
    resources :items, except: [:index, :destroy]
    resources :notifications, only: :index
  end

  root to: 'feeds#new'
end
