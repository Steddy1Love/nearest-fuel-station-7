class StationService
  def nearest_station(location)
    get_url("location=#{location}")[:fuel_stations].first
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def conn
    Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?") do |faraday|
      faraday.params["api_key"] = Rails.application.credentials.gov[:fuel_key]
    end
  end
end