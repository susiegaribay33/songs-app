class SongsController < ApplicationController
  def index
    all_songs = Song.all
    render json: all_songs.as_json
  end

  def show
    selected_song = Song.find_by(id: (params[:id]))
    render json: selected_song.as_json
  end

  def create
    new_song = Song.new(
      title: (params[:title]),
      album: (params[:album]),
      artist: (params[:artist]),
      year: (params[:year])
    )
    new_song.save
    render json: new_song.as_json 
  end  

  def update
    selected_song = Song.find_by(id: (params[:id]))
    selected_song.title = params[:title] || selected_song.title
    selected_song.album = params[:album] || selected_song.album
    selected_song.artist = params[:artist] || selected_song.artist
    selected_song.year = params[:year] || selected_song.year
    selected_song.save
    render json: selected_song.as_json
  end

  def destroy
    selected_song = Song.find_by(id: (params[:id]))
    selected_song.destroy
    render json: {message: "Your requested song has been deleted."}
  end

end
