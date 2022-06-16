# frozen_string_literal: true
module Api
  class PublicController < ActionController::API
    def public
      render json: { message: 'You don\'t need to be authenticated to call this' }
    end
  end
end
