class MapFacade
  def initialize
    @service = MapService.new
  end
  
  def route_time(from_location, to_location)
    data = @service.route(from_location, to_location)
    time_in_seconds = data[:route][:time]
    format_time(time_in_seconds)
  end

  private

  def format_time(time)
    ( time / 60 ).to_s 
  end
end