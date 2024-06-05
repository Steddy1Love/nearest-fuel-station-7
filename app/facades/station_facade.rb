class StationFacade
  attr_reader :station

  def initialize
    @service = StationService.new
  end

  def find_elec_station(location)
    station_data = @service.nearest_station(location)
    if station_data[:fuel_type_code] == "ELEC"
      Station.new(format_data(station_data))
    end
  end

  def format_data(data)
    {
      name: data[:station_name],
      address: [data[:street_address], data[:city], data[:state], data[zip]],
      fuel_type: data[:fuel_type_code],
      access_times: data[:access_days_time]
    }
  end
end