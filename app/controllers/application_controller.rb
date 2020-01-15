require "#{Rails.root}/lib/json_web_token.rb"

class ApplicationController < ActionController::API
  

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

    before_action :authenticate_request
    attr_reader :current_user
    
    #include ExceptionHandler

    # [...]
    private
    def authenticate_request
      @current_user = AuthorizeApiRequest.call(request.headers).result
      render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end
end
