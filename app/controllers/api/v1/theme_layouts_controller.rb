class Api::V1::ThemeLayoutsController < ApplicationController
  def index
    theme_layouts = ThemeLayout.all
    if theme_layouts
      render json: theme_layouts
    else
      render json: { message: "Error", errors: theme_layouts.errors.full_messages }, status: :not_found
    end
  end

  def show
  end

  def create
    theme_layout = ThemeLayout.new(theme_layout_params)
    if theme_layout.save
      render json: theme_layout, status: :created
    else
      render json: { message: "Failed to create theme layout", errors: theme_layout.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    theme_layout = ThemeLayout.find_by(id: params[:id])
    if theme_layout
      theme_layout.update(theme_layout_params)
      render json: { messgae: "Data successfully updated", data: theme_layout }
    else
      render json: { message: "Failed to update" }, status: :not_found
    end
  end

  def destroy
  end

  private
  def theme_layout_params
    params.permit(:name)
  end
end
