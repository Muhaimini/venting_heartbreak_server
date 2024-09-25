class Api::V1::AdminsController < ApplicationController
  before_action :authorize_request, except: [ :create ]

  def index
    admins = Admin.all
    if admins
      render json: admins
    else
      render json: { message: "Error", errors: admin.errors.full_messages }, status: :not_found
    end
  end

  def show
    admin = Admin.find_by(id: params[:id])
    if admin
      render json: admin
    else
      render json: { message: "Admin not found", errors: admin.errors.full_messages }, status: :not_found
    end
  end

  def create
    admin = Admin.new(admin_params)
    if admin.save
      render json: admin, status: :created
    else
      render json: { message: "Failed to create admin account", errors: admin.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    admin = Admin.find_by(id: params[:id])
    if admin
      admin.update(admin_params)
      render json: { messgae: "Data successfully updated", data: admin }
    else
      render json: { message: "Failed to update" }, status: :not_found
    end
  end

  def destroy
    admin = Admin.find_by(id: params[:id])
    if admin
      admin.destroy
      render json: { messgae: "Data successfully deleted" }
    else
      render json: { message: "Failed to delete" }, status: :not_found
    end
  end

  private
  def admin_params
    params.permit(:name, :password, :img)
  end
end
