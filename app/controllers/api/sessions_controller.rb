module Api
class SessionsController < ApplicationController
  def create
    account = Account.find_by(email: params[:email])&.authenticate(params[:password])

    payload = {
      iss: "example_app",
      sub: account.id,
      exp: (DateTime.current + 14.days).to_i
    }

    rsa_private = OpenSSL::PKey::RSA.new(File.read(Rails.root.join('auth/server.key')))
    token = JWT.encode(payload, rsa_private, "RS256")
    cookies[:token] = token
    render json: { status: :created }
  end
end
end