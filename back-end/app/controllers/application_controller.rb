class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def authenticate_user_from_token
		if !@current_user
			token = request.headers['token'].presence
			@user = User.find_by(authenticate_token: token.to_s)

			if @user
				@current_user ||= @user
			else
				render json: {}, status: :unauthorized
			end			
		end									
	end
end
