class Api::V1::SelectedInvitationsController < ApplicationController
  def index
  end

  def show
    selected_invitation = Api::V1::SelectedInvitation.find_by(id: params[:id])
    if selected_invitation
      render json: selected_invitation
    else
      render json: { message: "Invitation not found", errors: selected_invitation.errors.full_messages }, status: :not_found
    end
  end

  def create
    selected_invitation = Api::V1::SelectedInvitation.new(selected_invitation_params)
    if selected_invitation.save
      render json: selected_invitation, status: :created
    else
      render json: { message: "Failed to select invitation", errors: selected_invitation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private
  def selected_invitation_params
    params.permit(
      :invitation_theme_id,
      :closed_at,
      :published_at
    )
  end
end
