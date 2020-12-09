class PhotosController < ApplicationController

  before_action :check_if_logged_in, except: [ :index, :show ]

  def new
    @photo = Photo.new # for the 'form_with'
  end

  def create
    # We need to set the .user_id of the photo from @current_user
    # BUT that means the user has to be logged in!
    # So we need to lock down the photo routes, to ensure that
    # only logged-in users can see them

    # Photo.new with strong params creates the object in memory, with
    # the column attributes filled in from the form params... but not saved to DB
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to @photo, notice: 'Photo Uplopaded'
    else
      @garment = garment.find(params[:garment_id])
      render :new


    # this photo belongs to the logged-in user

      # Check for file upload and handle upload if present


    # actually do DB 'INSERT'

    # Add the user ID to this photo

    # 1. Set attribute after .create, and then .save
    # photo.user_id = @current_user.id
    # photo.save

    # 2. Use .update instead of setting attribute and .save as separate steps
    # photo.update user_id: @current_user.id

    # 3. Use the '<<' to add to a many association
    # @current_user.photos << photo
end
end

    redirect_to photo_path( photo.id ) # go to show page
  end

  def index
  end

  def show
    @photo = Photo.find params[:id]
  end

  def edit
    @photo = Photo.find params[:id]
    redirect_to login_path unless @photo.user_id == @current_user.id
  end

  def update
    photo = Photo.find params[:id]

    # Don't perform the edit unless the photo belongs to the user
    # redirect_to login_path and return unless photo.user_id == @current_user.id
    if photo.user_id != @current_user.id
      redirect_to login_path
      return
    end #if

    photo.update photo_params # strong params
    redirect_to photo_path(photo.id)
  end #update


  def destroy
  end

  private

  def photo_params
    params.require(:photo).permit(:caption, :image)
  end

  # class PhotosController
