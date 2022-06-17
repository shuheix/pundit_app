module Api
  class NotesController < ApplicationController
    before_action :authenticate_with_token!
    def index
      notes = Note.all
      render json: notes, status: :ok
    end
  end
end
