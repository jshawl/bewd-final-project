class PhotosController < ApplicationController 

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find( params[:id] )
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new photo_params
    redirect_to photo_path @photo if @photo.save
  end

  def destroy
    @photo = Photo.find( params[:id] )
    @photo.destroy
    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :attachment)
  end

end
