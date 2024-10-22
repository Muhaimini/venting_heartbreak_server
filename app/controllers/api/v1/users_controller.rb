class Api::V1::UsersController < ApplicationController
  before_action :authorize_request, except: [ :create ]

  def index
    users = Api::V1::User.includes(:role, :subscription).all
    if users
      render json: users
    else
      render json: { message: "Error", errors: users.errors.full_messages }, status: :not_found
    end
  end

  def show
    user = Api::V1::User.find_by(id: params[:id])
    if user
      render json: user
    else
      render json: { message: "User not found", errors: user.errors.full_messages }, status: :not_found
    end
  end

  def create
    user = Api::V1::User.new(user_params)
    # Set default role_id if not provided in params. default role is user
    role_id = Role.find_by(id: "bcca727b-9329-4076-b533-9176c9bf2a58")&.id
    user.role_id ||= role_id
    if user.save
      render json: user, status: :created
    else
      render json: { message: "Failed to create user account", errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    user = Api::V1::User.find_by(id: params[:id])
    if user
      user.update(user_params)
      render json: { messgae: "Data successfully updated", data: user }
    else
      render json: { message: "Failed to update" }, status: :not_found
    end
  end

  def destroy
    user = Api::V1::User.find_by(id: params[:id])
    if user
      user.destroy
      render json: { messgae: "Data successfully deleted" }
    else
      render json: { message: "Failed to delete" }, status: :not_found
    end
  end

  private
  def user_params
    params.permit(
      :subscription_id,
      :role_id,
      :username,
      :email,
      :password,
      :avatar,
      :initial_name,
      :label_color,
    )
  end
end
