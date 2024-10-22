class Api::V1::SpecialGuestsController < ApplicationController
  def index
  end

  def show
  end

  def create
    special_guest = Api::V1::InvitationSpecialGuest.new(special_guest_params)
    if special_guest.save
      render json: special_guest, status: :created
    else
      render json: { message: "Failed to create special guests", errors: special_guest.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private
  def special_guest_params
    params.permit(
      :selected_invitation_id,
      :name,
      :description
    )
  end
end
