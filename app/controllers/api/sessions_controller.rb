module Api
  class SessionsController < ApplicationController
    def create
      def create
        token = TokenService.issue_by_password!(params[:email], params[:password])
        cookies[:token] = token
        render status: :created
      end
    end
  end
end