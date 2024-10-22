class Api::V1::UserGuestsController < ApplicationController
  before_action :authorize_request, except: [ :create, :show ]

  def index
    user_guests = Api::V1::UserGuest.includes(:role).all
    if user_guests
      render json: user_guests
    else
      render json: { message: "Error", errors: user_guests.errors.full_messages }, status: :not_found
    end
  end

  def show
  end

  def create
    user_guest = Api::V1::UserGuest.new(user_guest_params)
    role_id = Api::V1::Role.find_by(value: "user_guest")&.id
    user_guest.role_id ||= role_id
    if user_guest.save
      render json: user_guest, status: :created
    else
      render json: { message: "Failed to create anonymous user", errors: user_guest.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
    user_guest = Api::V1::UserGuest.find_by(id: params[:id])
    if user_guest
      user_guest.destroy
      render json: { messgae: "Data successfully deleted" }
    else
      render json: { message: "Failed to delete" }, status: :not_found
    end
  end

  private
  def user_guest_params
    params.permit(:device_id, :role_id)
  end
end
