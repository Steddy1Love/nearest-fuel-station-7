class SearchController < ApplicationController
  def index
    binding.pry
    station = StationFacade.new
    @station_location = station.find_elec_station(params[:location])
    @route = MapFacade.new
    @time = @route.route_time(params[:location], @station_location)
  end
end