module Api
  class SessionsController < ApplicationController
    def create
      token = TokenService.issue_by_password!(params[:email], params[:password])
      cookies[:token] = token

      render json: { token: token, account: current_account },status: :created
    end
  end
end