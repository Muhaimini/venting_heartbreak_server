class Api::V1::InvitationSheetsController < ApplicationController
  def index
    invitation_sheets = filter_invitation_sheets
    render json: invitation_sheets
  end

  def create
    invitation_sheet = Api::V1::InvitationSheet.new(invitation_sheet_params)
    if invitation_sheet.save
      render json: invitation_sheet, status: :created
    else
      render json: { message: "Failed to create sheet" }, status: :unprocessable_entity
    end
  end
  
  def show
    invitation_sheet = Api::V1::InvitationSheet.find_by(id: params[:id])
    if invitation_sheet
      render json: invitation_sheet
    else
      render json: { message: "Sheet not found", error: invitation_sheet.errors.full_messages }, status: :not_found
    end
  end

  def filter_invitation_sheets
    invitation_sheets = Api::V1::InvitationSheet.all
    invitation_sheets = invitation_sheets.invitation_desk_id(params[:invitation_desk_id]) if params[:invitation_desk_id].present?
    invitation_sheets
  end

  def invitation_sheet_params
    params.permit(:invitation_desk_id, :content, :creator_id)
  end

end
