class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end
  def create
    @photo = Photo.new params[:photo]
    if @photo.save
      redirect_to @photo
    else
      render :new
    end
  end
  def show
    @photo = Photo.find params[:id]
  end
end
