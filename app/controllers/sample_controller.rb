class SampleController < ApplicationController
  def data
    render json: { messgae: "Welcome to our website!" }
  end
end
