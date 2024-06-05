class StationFacade
  attr_reader :station

  def initialize
    @service = StationService.new
  end

  def find_elec_station(location)
    station_data = @service.nearest_station(location)
    if station_data[:fuel_type_code] == "ELEC"
      @station = Station.new(format_data(station_data))
    end
    @station.format_address
  end

  def format_data(data)
    {
      name: data[:station_name],
      address: [data[:street_address], data[:city], data[:state], data[zip]],
      fuel_type: data[:fuel_type_code],
      access_times: data[:access_days_time]
    }
  end

  def distance(location)
    distance_unformatted = @service.nearest_station(location)
    if distance_unformatted[:fuel_type_code] == "ELEC"
      distance_to_float = distance_unformatted.to_f
      formatted_distance = sprintf('%.1f', distance_to_float)
    end
  end
end