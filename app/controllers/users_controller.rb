class UsersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def show
      user = User.find_by(id: params[:id])
      render json: user, include: :items
  end
  
  private

  def render_not_found
    render json: { error: "User Not Found" }, status: 404
  end

end
