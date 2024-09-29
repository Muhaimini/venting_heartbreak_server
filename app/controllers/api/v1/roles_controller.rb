class Api::V1::RolesController < ApplicationController
  before_action :authorize_request, except: [ :index, :create ]

  def index
    roles = Role.all
    if roles
      render json: roles
    else
      render json: { message: "Error", errors: roles.errors.full_messages }, status: :not_found
    end
  end

  def show
    role = Role.find_by(id: params[:id])
    if role
      render json: role
    else
      render json: { message: "Role not found", errors: role.errors.full_messages }, status: :not_found
    end
  end

  def create
    role = Role.new(role_params)
    if role.save
      render json: role, status: :created
    else
      render json: { message: "Failed to create role account", errors: role.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    role = Role.find_by(id: params[:id])
    if role
      role.update(role_params)
      render json: { messgae: "Data successfully updated", data: role }
    else
      render json: { message: "Failed to update" }, status: :not_found
    end
  end

  def destroy
    role = Role.find_by(id: params[:id])
    if role
      role.destroy
      render json: { messgae: "Data successfully deleted" }
    else
      render json: { message: "Failed to delete" }, status: :not_found
    end
  end

  private
  def role_params
    params.permit(:value)
  end
end
