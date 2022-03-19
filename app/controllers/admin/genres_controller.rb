class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
<<<<<<< HEAD
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render :edit
    end
=======
    @genre.update(genre_params)
    redirect_to admin_genres_path
>>>>>>> d8285dd (made page[public(items#index), admin(genres#index, genres#edit, items#index, items#new, items#show)])
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
