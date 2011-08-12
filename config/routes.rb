Heedfeed::Application.routes.draw do
  resources :feeds, except: :index do
    resources :items, except: [:index, :destroy]
  end

  root to: 'feeds#new'
end
