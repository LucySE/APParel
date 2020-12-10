class GarmentsController < ApplicationController


  def new
    @garment = Garment.new  # make a blank Garment object to give to 'form_with' in the template
  end

  def create

      @garment = Garment.create(
        title:  params[:garment][:title],
        garment_type:  params[:garment][:garment_type],
        points:  params[:garment][:points],
       size:  params[:garment][:size],
       user_id: @current_user.id,
       description: params[:garment][:description]
     )

    if @garment.persisted?
      if params[:file].present?
         # Then call Cloudinary's upload method, passing in the file in params
         response = Cloudinary::Uploader.upload(params[:file])
         # save the response id into the appropriate field of our new model
         # Using the public_id allows us to use Cloudinary's powerful image
         # transformation methods.
         # garment.image = response["public_id"] # this is an URL
         # garment.save
         Photo.create(
           image: response["public_id"],
           garment_id: @garment.id
         )
      end #if file present

      redirect_to garment_path(@garment.id)
    else

      render :new
    end #end of the else if not persisted

   end  #create
  #
   def index
     @garments = Garment.all
   end
  #
   def show
     @garment = Garment.find params[:id]
   end
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

  end

   #private

  #def garment_params
     #params.require(:garment).permit(:email, :password, :password_confirmation, :name)
   # end
end # class GarmentsController
