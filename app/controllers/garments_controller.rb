class GarmentsController < ApplicationController


  def new
    @garment = Garment.new  # make a blank Garment object to give to 'form_with' in the template
  end

  def create

      @garment = Garment.create(
        title:  params[:garment][:title],
        garment_type:  params[:garment][garment_type],
       size:  params[:garment][size],
       points:  params[:garment][points],
       user_id: params[:garment][user_id],
       description: params[:garment][description]
     )

    if @garment.persisted?
      # log the garment in automatically so they don't
      # immediately have to enter the same details again
      # into the login form
      session[:garment_id] = @garment.id
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
  Garment.destroy params[:id]
  redirect_to garments_path
#enabled
   end

   #private

  #def garment_params
     #params.require(:garment).permit(:email, :password, :password_confirmation, :name)
   # end
end # class GarmentsController
