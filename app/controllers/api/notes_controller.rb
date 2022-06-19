module Api
  class NotesController < ApplicationController
    before_action :authenticate_with_token!

    def index
      notes = policy_scope(Note)
      render json: notes, status: :ok
    end

    def show
      note = Note.find(params[:id])
      render json: note
    end

    def create
      note = Note.new(set_note_params)
      authorize note
      note.save
      render json: note, status: :created
    end

    def update
      note = Note.find(params[:id])
      authorize note
      note.update!(set_note_params)
      render json: note
    end


    def destroy
      note = Note.find(params[:id])
      authorize note
      note.destroy!
      render json: note, status: :ok
    end

    private
    def set_note_params
      params.permit(:title,:content,:company_id,:group_id,:account_ids)
    end
  end
end
