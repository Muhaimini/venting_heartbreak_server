class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      # If authentication is successful
      token = JsonWebToken.encode(user_id: user.id)
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
