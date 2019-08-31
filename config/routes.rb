Rails.application.routes.draw do
  root 'home#top'
  get '/mypost', to: 'posts#mypost'
  get '/favorite', to: 'posts#favorite'
  resources :faqs, only: [:index, :new, :create]
  get '/faqs/thanks', to: 'faqs#thanks'
  resources :posts
  resources :likes, only: [:create, :destroy]
  resources :login, only: [:new, :create]
  delete '/logout', to: 'login#destroy'
end
