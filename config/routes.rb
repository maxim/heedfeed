Heedfeed::Application.routes.draw do
  resources :feeds, :except => :index do
    resources :items
  end

  root :to => 'feeds#new'
end
