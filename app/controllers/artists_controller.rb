class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def new; end

  def create
    @artist = Artist.create(strong_params(:name, :bio))
    redirect_to artist_path(@artist)
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
  @artist = Artist.find(params[:id])
  end


  def update
    @artist = Artist.find(params[:id])
    @artist.update(strong_params(:name, :bio))
    redirect_to artist_path(@artist)
  end

  def strong_params(*args)
    params.require(:artist).permit(*args)
  end
end
