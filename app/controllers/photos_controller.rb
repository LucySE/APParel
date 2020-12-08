class PhotosController < ApplicationController


  def new
    @photo = Photo.new  # make a blank Photo object to give to 'form_with' in the template
  end

  def create

      @photo = Photo.create(
       image: params[:photo][:image],
       caption: params[:photo][:caption],
       garment_id: params[:photo][:garment_id],
     )

    if @photo.persisted?
      # log the photo in automatically so they don't
      # immediately have to enter the same details again
      # into the login form
      session[:photo_id] = @photo.id
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
    def index
      @photos = Photo.all
   end
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
  Photo.destroy params[:id]
  redirect_to photos_path
#enabled
   end

   #private

  #def photo_params
     #params.require(:photo).permit(:email, :password, :password_confirmation, :name)
   # end
end # class PhotosController
