class MapService
  def route(from_location, to_location)
    get_url("from=#{from_location}&to=#{to_location}")
  end
  
  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def conn
    Faraday.new(url: "https://www.mapquestapi.com/directions/v2/route") do |faraday|
          faraday.params["key"] = Rails.application.credentials.mapquest[:map_key]
    end
  end
end