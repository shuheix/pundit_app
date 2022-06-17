class AuthenticationService
  def self.authenticate_account_with_password!(email, password)
    account = Account.find_by(email: email)&.authenticate(password)
    raise AuthenticationError if user.nil
    account
  end

  def self.authenticate_account_with_token!(token)
    rsa_private = OpenSSL::PKey::RSA.new(File.read(Rails.root.join('auth/server.key')))

    begin
      decoded_token = JWT.decode(token, rsa_private, true, { algorithm: 'RS256' })
    rescue JWT::DecodeError, JWT::ExpiredSignature, JWT::VerificationError
      raise AuthenticationError
    end

    account_id = decoded_token.first["sub"]
    account = Account.find(account_id)
    raise ActionController if account.nil?

    account
  end
end