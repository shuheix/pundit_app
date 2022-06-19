module Api
  class AccountsController < ApplicationController
    def index
      authorize Account
      accounts = Account.all
      render json: accounts
    end
  end
end