class Api::V1::InvitationCommentsController < ApplicationController
  def index
  end

  def show
    invitation_comments = Api::V1::InvitationComment.where(selected_invitation_id: params[:id])
    if invitation_comments
      render json: invitation_comments
    else
      render json: { message: "Comments not found", errors: invitation_comments.errors.full_messages }, status: :not_found
    end
  end

  def create
    invitation_comment = Api::V1::InvitationComment.new(invitation_comment_params)
    if invitation_comment.save
      render json: invitation_comment, status: :created
    else
      render json: { message: "Failed to comment", errors: invitation_comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private
  def invitation_comment_params
    params.permit(
      :selected_invitation_id,
      :user_guest_id,
      :user_id,
      :text
    )
  end
end
