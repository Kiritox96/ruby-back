class OthersController < ApplicationController
  
  def index
    @others = Others.all
    render json:@others
  end
end
