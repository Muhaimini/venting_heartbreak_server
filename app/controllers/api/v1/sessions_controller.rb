class Api::V1::SessionsController < ApplicationController
  def create
    admin = Admin.find_by(name: params[:name])
    if admin&.authenticate(params[:password])
      # If authentication is successful
      token = JsonWebToken.encode(user_id: admin.id)
      render json: { message: "Login successfully", token: token }, status: :ok
    else
      render json: { message: "Invalid credentials" }, status: :unauthorized
    end
  end

  def destroy
    # If you're using sessions, handle logout logic here
    # For token-based authentication, you might not need this
    render json: { message: "Logged out successfully" }, status: :ok
  end
end
