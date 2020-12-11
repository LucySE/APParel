class GarmentsController < ApplicationController

  before_action :check_if_logged_in

  def claim

    #  1. get the garment by id and the id is in params id.
    garment = Garment.find params[:id]
    # 2. take points off the current user and give them to the owner of the garments.
    garment.user.update points: (garment.user.points + garment.points)
    @current_user.update points: (@current_user.points - garment.points)
    # 3. Garments user id needs to transfer to current user id.
    # 4. Change garment claimed column to true.
    garment.update user_id: @current_user.id, claimed:true

    # 5. current user will be redirected back to profile page and new outfit will now appear.
    redirect_to user_path(@current_user.id)
  end

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
     @garments = Garment.where claimed:false
   end
  #
   def show
     @garment = Garment.find params[:id]
   end
  #
  def garment_params
  params.require(:garment).permit(:title, :body, photos: [])
end
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
