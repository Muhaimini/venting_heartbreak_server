class Api::V1::SubscriptionsController < ApplicationController
  before_action :authorize_request

  def index
    subscriptions = Subscription.all
    if subscriptions
      render json: subscriptions
    else
      render json: { message: "Error", errors: subscriptions.errors.full_messages }, status: :not_found
    end
  end

  def show
    subscription = Subscription.find_by(id: params[:id])
    if subscription
      render json: subscription
    else
      render json: { message: "Subscription not found", errors: subscription.errors.full_messages }, status: :not_found
    end
  end

  def create
    subscription = Subscription.new(subscription_params)
    user = User.find_by(id: params[:user_id])

    if user.nil?
      render json: { message: "Failed to create subscription account. User not found" }, status: :not_found
      return
    end

    if subscription.save
      if user.update_column(:subscription_id, subscription.id)
        render json: subscription, status: :created
      else
        render json: { message: "Failed to update user with subscription", errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    else
      render json: { message: "Failed to create subscription account", errors: subscription.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    subscription = Subscription.find_by(id: params[:id])
    if subscription
      subscription.update(subscription_params)
      render json: { messgae: "Data successfully updated", data: subscription }
    else
      render json: { message: "Failed to update" }, status: :not_found
    end
  end

  def destroy
    subscription = Subscription.find_by(id: params[:id])
    if subscription
      subscription.destroy
      render json: { messgae: "Data successfully deleted" }
    else
      render json: { message: "Failed to delete" }, status: :not_found
    end
  end

  private
  def subscription_params
    params.permit(:user_id, :expired_at)
  end
end
