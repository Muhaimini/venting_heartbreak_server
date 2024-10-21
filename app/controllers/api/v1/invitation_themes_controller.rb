class Api::V1::InvitationThemesController < ApplicationController
  PERMITTED_KEYS = %w[creator_id type_theme_id theme_layout_id label description img_cover song_src started_at ended_at].freeze

  def index
    invitation_themes = InvitationTheme.includes(:creator, :theme_type, :theme_layout).all
    if invitation_themes
      render json: invitation_themes
    else
      render json: { message: "Error", errors: invitation_themes.errors.full_messages }, status: :not_found
    end
  end

  def show
    invitation_theme = InvitationTheme.find_by(id: params[:id])
    if invitation_theme
      render json: invitation_theme
    else
      render json: { message: "Invitation theme not found", errors: invitation_theme.errors.full_messages }, status: :not_found
    end
  end

  def create
    invitation_theme = InvitationTheme.new(invitation_theme_params)
    if invitation_theme.save
      render json: invitation_theme, status: :created
    else
      render json: {
        message: "Failed to create invitation theme",
        errors: invitation_theme.errors.full_messages
        }, status: :unprocessable_entity
    end
  end

  def update
    invitation_theme = InvitationTheme.find_by(id: params[:id])
    if invitation_theme
      invitation_theme.update(invitation_theme_params)
      render json: { messgae: "Data successfully updated", data: invitation_theme }
    else
      render json: { message: "Failed to update" }, status: :not_found
    end
  end

  def destroy
  end

  def validate_query_params
    invalid_keys = params.keys - PERMITTED_KEYS
    unless invalid_keys.empty?
      render json: { message: "Invalid query parameters: #{invalid_keys.join(', ')}" }, status: :unprocessable_entity
    end
  end

  private
  def invitation_theme_params
    params.permit(
      :creator_id,
      :type_theme_id,
      :theme_layout_id,
      :label,
      :description,
      :img_cover,
      :song_src,
      :started_at,
      :ended_at
    )
  end
end
