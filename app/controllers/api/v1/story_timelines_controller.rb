class Api::V1::StoryTimelinesController < ApplicationController
  def index
  end

  def show
  end

  def create
    story_timeline = StoryTimeline.new(story_timeline_params)
    if story_timeline.save
      render json: story_timeline, status: :created
    else
      render json: { message: "Failed to create story timeline", errors: story_timeline.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private
  def story_timeline_params
    params.permit(
      :selected_invitation_id,
      :title,
      :description
    )
  end
end
