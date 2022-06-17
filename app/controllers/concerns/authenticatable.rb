module Authenticatable

  def authenticate_with_token!
    raise AuthenticationError if unauthorized?
  end

  def current_account
    AuthenticationService.authenticate_account_with_token!(cookies[:token])
  rescue AuthenticationError
    nil
  end

  def current_user
    current_account
  end

  def unauthorized?
    current_account.nil?
  end
end