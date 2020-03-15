Rails.application.routes.draw do
  root 'home#top'
  get '/mypost', to: 'posts#mypost'
  get '/favorite', to: 'posts#favorite'
  resources :faqs, only: [:index, :new, :create]
  get '/faqs/thanks', to: 'faqs#thanks'
  resources :posts
  resources :replies, only: [:edit, :update, :destroy] do
    member do
      get :end
    end
  end
  get '/myreplies', to: 'replies#myreplies'
  resources :likes, only: [:create, :destroy]
  resources :login, only: [:new, :create]
  delete '/logout', to: 'login#destroy'
  resources :ikou, only: [:new, :create, :index]#index追加したのはrender直後にブラウザ更新するとルーティングエラー出るため
  get '/ikou/end', to: 'ikou#end'
  get '/search', to: 'posts#search'
end
