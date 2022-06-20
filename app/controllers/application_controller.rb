class ApplicationController < ActionController::API
  include ActionController::Cookies
  include Authenticatable
  include Pundit


  rescue_from AuthenticationError, with: :render_unauthorized_error
  rescue_from Pundit::NotAuthorizedError, with: :render_pundit_unauthorized_error

  def render_unauthorized_error
       render json: { message: 'unauthorized' }, status: :unauthorized
  end

  def render_pundit_unauthorized_error
    render json: { message: 'pundit_unauthorized' }, status: :unauthorized
  end
end
