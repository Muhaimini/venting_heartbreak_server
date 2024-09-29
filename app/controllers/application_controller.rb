class ApplicationController < ActionController::API
  # before_action :authorize_request

  def authorize_request
    header = request.headers["Authorization"]
    token = header.split(" ").last if header
    decoded = JsonWebToken.decode(token)

    puts decoded

    @current_user = User.find_by(id: decoded["user_id"]) if decoded
    render json: { message: "Unauthorized" }, status: :unauthorized unless @current_user
  end

  def not_found
    render json: { message: "404" }, status: :not_found, pretty: true
  end
end
