class SearchController < ApplicationController
  def index
    binding.pry
    @station = StationFacade.new(params[:location])
    @route = MapFacade.new(params[:location], @station.location)
  end
end