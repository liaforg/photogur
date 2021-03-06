class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def show
    @pictures = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
      if @picture.save
        redirect_to "/pictures"
      else
        render :new
      end
    end

  def picture_params
    {title: params[:picture][:title], artist: params[:picture][:artist], url: params[:picture][:url]}
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
   @picture = Picture.find(params[:id])
   @picture.destroy
   redirect_to "/pictures"
 end

end
