require "#{Rails.root}/lib/json_web_token.rb"

class ApplicationController < ActionController::API
    before_action :set_raven_context


    def authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        begin
           @decoded = JsonWebToken.decode(header)
           @current_user = User.find(@decoded[:user_id])
        rescue JWT::DecodeError => e
           render json: { errors: e.message }, status: :unauthorized
        end
    end

    #before_action :authenticate_request
    attr_reader :current_user
    

    private
    def set_raven_context
      Raven.user_context(id: session[:current_user_id]) # or anything else in session
      Raven.extra_context(params: params.to_unsafe_h, url: request.url)
    end
end
