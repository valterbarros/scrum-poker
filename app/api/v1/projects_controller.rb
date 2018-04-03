class Api::V1::ProjectsController < ActionController::API
  def teamwork
    require 'pry'; binding.pry
  end

  private

  def projects_params
    params.require(:api_tasks).permit(:token)
  end
end
