class UsersController < ApplicationController


  def new
    @user = User.new  # make a blank User object to give to 'form_with' in the template
  end

  def create

      @user = User.create(
       first_name: params[:user][:first_name],
       last_name: params[:user][:last_name],
       address_text: params[:user][:address_text],
       clothing_size: params[:user][:clothing_size],
     )

    if @user.persisted?
      # log the user in automatically so they don't
      # immediately have to enter the same details again
      # into the login form
      session[:user_id] = @user.id
      redirect_to root_path
    else
      # we won't do this:
       redirect_to login_path

      # instead, we render the template for the 'new' action
      # i.e., the blank form, from this 'create' action
      render :new
    end

   end  #create
  #
  # def index
  # end
  #
  # def show
  # end
  #
  # def edit
  # end
  #
  # def update
  # end
  #
def destroy
  User.destroy params[:id]
  redirect_to users_path
#enabled
   end

   #private

  #def user_params
     #params.require(:user).permit(:email, :password, :password_confirmation, :name)
   # end
end # class UsersController
