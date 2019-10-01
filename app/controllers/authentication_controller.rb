# app/controllers/authentication_controller.rb
class AuthenticationController < ApplicationController
  skip_before_action :authorize_request, only: [:authenticate, :destroy]
  # return auth token once user is authenticated
  def authenticate
    auth_token = AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
    json_response(auth_token: auth_token)
  end

  def destroy
    current_user = nil
    if current_user.save
      response = { message: Message.logout}
      json_response(response)
    else
      head(:unauthorized_request)
    end
  end

  private

  def auth_params
    params.permit(:email, :password)
  end
end