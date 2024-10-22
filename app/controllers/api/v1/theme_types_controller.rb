class Api::V1::ThemeTypesController < ApplicationController
  def index
    theme_types = Api::V1::ThemeType.all
    if theme_types
      render json: theme_types
    else
      render json: { message: "Error", errors: theme_types.errors.full_messages }, status: :not_found
    end
  end

  def show
  end

  def create
    theme_type = Api::V1::ThemeType.new(theme_type_params)
    if theme_type.save
      render json: theme_type, status: :created
    else
      render json: { message: "Failed to create theme type", errors: theme_type.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    theme_type = Api::V1::ThemeType.find_by(id: params[:id])
    if theme_type
      theme_type.update(theme_type_params)
      render json: { messgae: "Data successfully updated", data: theme_type }
    else
      render json: { message: "Failed to update" }, status: :not_found
    end
  end

  def destroy
  end

  private
  def theme_type_params
    params.permit(:title, :description, :img_cover)
  end
end
