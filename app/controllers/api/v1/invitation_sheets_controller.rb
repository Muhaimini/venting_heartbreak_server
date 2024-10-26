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
      render json: { message: "Failed to create a sheet" }, status: :unprocessable_entity
    end
  end
  
  def show
    invitation_sheet = get_invitation_sheet
    if invitation_sheet
      render json: invitation_sheet
    else
      render json: { message: "Sheet not found", error: invitation_sheet.errors.full_messages }, status: :not_found
    end
  end

  def update
    invitation_sheet = get_invitation_sheet
    if invitation_sheet.update(update_invitaition_sheet_params)
      render json: invitation_sheet
    else
      render json: { message: "Sheet failed to update", error: invitation_sheet.errors.full_messages }, status: :not_found
    end
  end

  def destroy
    invitation_sheet = get_invitation_sheet
    if invitation_sheet.destroy
      render json: { message: "Sheet successfully deleted" }
    else
      render json: { message: "Failed to delete the shret" }, status: :not_found
    end
  end

  private

  def get_invitation_sheet
    Api::V1::InvitationSheet.find_by(id: params[:id])
  end

  def filter_invitation_sheets
    invitation_sheets = Api::V1::InvitationSheet.order(created_at: :asc)
    invitation_sheets = invitation_sheets.invitation_desk_id(params[:invitation_desk_id]) if params[:invitation_desk_id].present?
    invitation_sheets
  end

  def update_invitaition_sheet_params
    params.permit(:content)
  end

  def invitation_sheet_params
    params.permit(:invitation_desk_id, :content, :creator_id)
  end

end
