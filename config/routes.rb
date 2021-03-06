Rails.application.routes.draw do
  scope :api do
    scope :auth do
      post '/signup', to: 'authentication#signup'
      post '/login', to: 'authentication#login'
    end
    resources :requirements, only: [:create, :index, :show]
    resources :companies, only: [:create, :show]
    resources :users, only: [:index, :show]

    put '/users', to: 'users#update'
    get '/collocutors', to: 'users#get_collocutors'
    put '/companies', to: 'companies#update'
    post '/interests/requirements/:requirement_id', to: 'interests#create'
    post '/entries/requirements/:requirement_id', to: 'entries#create'
    post '/scouts/users/:user_id', to: 'scouts#create'
    post '/messages/to/:reciever_id', to: 'messages#create'
    scope :messages do
      get '/', to: 'messages#index'
      post '/to/:reciever_id', to: 'messages#create'
    end
  end 
end
