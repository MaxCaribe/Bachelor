class Api::V1::LocationController < Api::V1::BaseController
  def update
    @current_user.create_location(location_params)
  end

  private

  def location_params
    params.require(:location).permit(:latitude, :longitude)
  end
end