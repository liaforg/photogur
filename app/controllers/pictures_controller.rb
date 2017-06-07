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
    render text: "Received POST request to '/pictures' with the data URL: #{params}"
  end

end
