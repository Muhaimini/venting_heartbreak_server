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
    invitation_desk = Api::V1::InvitationDesk.find_by(id: params[:id])
    if invitation_desk
      render json: invitation_desk
    else
      render json: { message: "Desk not found", error: invitation_desk.errors.full_messages }, status: :not_found
    end
  end

  private

  def filter_invitation_desks
    invitation_desks = Api::V1::InvitationDesk.all
    invitation_desks = invitation_desks.created_by(params[:creator_id]) if params[:creator_id].present?
    invitation_desks
  end

  def invitation_desk_params
    params.permit(:invitation_layout_id, :description, :creator_id)
  end
end
