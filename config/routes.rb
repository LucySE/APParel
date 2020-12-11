Rails.application.routes.draw do

  # like get '/' => 'pages#home'
  root to: 'pages#home'

  # Login/logout routes
  get '/login'  => 'session#new'        # showing the login form
  post '/login' => 'session#create'     # form submits to here, performs login, redirects
  delete '/login' => 'session#destroy'  # logout link goes here, perform logout, redirect

  # Create all 7 CRUD routes for our User model
  resources :users

def update
  @user = User.find(params[:id])
  @user.update(user_params)

  redirect_to user_path(@user)

end
  post '/garments/:id/claim' => 'garments#claim', as: 'claim_garment'
  resources :garments
  resources :photos

   post 'photo/store'
   root 'photo#index'
  
#     users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy





end # routes above here!
