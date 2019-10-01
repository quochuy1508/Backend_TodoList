class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  # POST /signup
  # return authenticated token upon signup
  def create
    user = User.new(user_params)
    if user.save
      auth_token = AuthenticateUser.new(user.email, user.password).call
      response = { message: Message.account_created, auth_token: auth_token }
      json_response(response, :created)
    else
      response = { message: Message.account_not_created}
      json_response(response)
    end

  end

  def show
    json_response(current_user)
  end


  def update
    if @current_user.update_attributes(user_params)
      json_response(@current_user)
    else
      response = { message: Message.update_false}
      json_response(response)
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
