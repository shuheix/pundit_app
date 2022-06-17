module Api
  class NotesController < ApplicationController
    def index
      accounts = Account.all
      render json: accounts
    end
  end
end
