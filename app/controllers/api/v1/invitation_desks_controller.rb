class Api::V1::InvitationDesksController < ApplicationController
  def index
    invitation_desks = filter_invitation_desks
    render json: invitation_desks
  end

  def create
    invitation_desk = Api::V1::InvitationDesk.new(invitation_desk_params)
    if invitation_desk.save
      render json: invitation_desk, status: :created
    else
      render json: { message: "Failed to create desk" }, status: :unprocessable_entity
    end
  end

  def show
    invitation_desk = get_invitation_desk
    if invitation_desk
      render json: invitation_desk
    else
      render json: { message: "Desk not found", error: invitation_desk.errors.full_messages }, status: :not_found
    end
  end

  def update
    invitation_desk = get_invitation_desk
    if invitation_desk.update(update_invitation_desk_params)
      render json: invitation_desk
    else
      render json: { message: "Desk failed to updated" }, status: :not_found
    end
  end

  def destroy
    invitation_desk = get_invitation_desk
    if invitation_desk.destroy
      render json: { message: "Desk successfully deleted" }
    else
      render json: { message: "Desk not found" }, status: :not_found
    end
  end

  private

  def get_invitation_desk
    Api::V1::InvitationDesk.includes(:music_theme).find_by(id: params[:id])
  end

  def filter_invitation_desks
    invitation_desks = Api::V1::InvitationDesk.all
    invitation_desks = invitation_desks.created_by(params[:creator_id]) if params[:creator_id].present?
    invitation_desks
  end

  def update_invitation_desk_params
    params.permit(:invitation_layout_id, :description, :music_theme_id)
  end

  def invitation_desk_params
    params.permit(:invitation_layout_id, :description, :creator_id, :music_theme_id)
  end
end
