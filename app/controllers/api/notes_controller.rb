module Api
  class NotesController < ApplicationController
    before_action :authenticate_with_token!
    def index
      authorize :note, :show?
      notes = Note.all
      render json: notes, status: :ok
    end

    def show
    end

    def create
    end

    def destroy
    end
  end
end
