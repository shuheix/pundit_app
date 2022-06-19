module Api
  class AccountsController < ApplicationController
    def index
      authorize Account
      Account.all
      render json: accounts
    end

    def show
      account = Account.find(params[:id])
      render json: account
    end

    def create
      account = Account.new(set_account)
      authorize :account
      render json: account,status: :created
    end

    def update
      account = Account.find(current_account.id)
      authorize :account
      account.update!(set_account)
      render json: account, status: :ok
    end

    def destroy
      account = Account.find(current_account.id)
      authorize :account
      account.destroy!
      render json: account, status: :ok
    end

    private

    def set_account
      params.permit(:email,:password,:name)
    end
  end
end