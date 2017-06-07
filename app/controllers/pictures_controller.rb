class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def show
    @pictures = Picture.find(params[:id])
  end

  def new
    @pictures = Picture.new
  end

  def create
    @pictures = Picture.new(picture_params)
      if @pictures.save
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
    @pictures = Picture.find(params[:id])
    if @pictures.update_attributes(picture_params)
      redirect_to "/pictures/#{@pictures.id}"
    else
      render :edit
    end
  end


end
