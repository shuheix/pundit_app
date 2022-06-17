class TokenService

    def self.issue_by_password!(email, password)
      account = AuthenticationService.authenticate_account_with_password!(email, password)
      issue_token(account.id)
    end

    private

    def self.issue_token(id)
      payload = {
        iss: "example_app",
        sub: id,
        exp: (DateTime.current + 14.days).to_i
      }
      rsa_private = OpenSSL::PKey::RSA.new(File.read(Rails.root.join('auth/server.key')))
      JWT.encode(payload, rsa_private, "RS256")
    end

end
