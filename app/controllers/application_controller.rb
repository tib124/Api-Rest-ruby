class ApplicationController < ActionController::API
    before_action :authenticate

    rescue_from JWT::VerificationError, with: :invalid_token
    rescue_from JWT::DecodeError, with: :decode_error



    private
    def authenticate
        authorization_header = request.headers["Authorization"]
        token = authorization_header.split(" ").last if authorization_header
        decoded_token = JsonWebToken.decode(token)

       @user = User.find(decoded_token[:user_id])
    end

    def invalid_token
        render json: { message: "Invalid token" }, status: :unauthorized
    end
    def decode_error
        render json: { message: "Token decode error" }, status: :unauthorized
    end
end
