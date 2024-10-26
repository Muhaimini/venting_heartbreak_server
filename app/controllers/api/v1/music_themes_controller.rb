class Api::V1::MusicThemesController < ApplicationController
  def index
    music_themes = filter_music_themes
    render json: music_themes
  end

  def create
    music_theme = Api::V1::MusicTheme.new(music_theme_params)
    if music_theme.save
      render json: music_theme, status: :created
    else
      render json: { message: "Failed to create a music theme" }, status: :unprocessable_entity
    end
  end
  
  def show
    music_theme = get_music_theme
    if music_theme
      render json: music_theme
    else
      render json: { message: "Music theme not found", error: music_theme.errors.full_messages }, status: :not_found
    end
  end

  def update
    music_theme = get_music_theme
    if music_theme.update(music_theme_params)
      render json: music_theme
    else
      render json: { message: "Music theme failed to update", error: music_theme.errors.full_messages }, status: :not_found
    end
  end

  def destroy
    music_theme = get_music_theme
    if music_theme.destroy
      render json: { message: "Music theme successfully deleted" }
    else
      render json: { message: "Failed to delete the shret" }, status: :not_found
    end
  end

  private

  def filter_music_themes
    music_themes = Api::V1::MusicTheme.all
    music_themes = music_themes.search_by_title_or_artist(params[:search]) if params[:search].present?
    music_themes
  end

  def get_music_theme
    Api::V1::MusicTheme.find_by(id: params[:id])
  end

  def music_theme_params
    params.permit(:src, :title, :artist, :search)
  end
end
