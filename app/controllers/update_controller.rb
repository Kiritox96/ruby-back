class UpdateController < ApplicationController
  def index
    @update = Update.all.first
    if @update
      render json: @update
    else
      render json: 404
    end
  end


end
