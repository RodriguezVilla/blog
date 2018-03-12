Rails.application.routes.draw do
   #Añadidopara usuarios
    get 'admin' => 'admin#index'
    controller :sessions do
      get 'login' => :new
      post 'login' => :create
      delete 'logout' => :destroy
    end
    #FinUsuarios

  get 'admin/index'

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users
  resources :publicidads
  get 'posts/index'
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'posts#index'
end
