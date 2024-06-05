class Station
  attr_reader :name,
              :address,
              :fuel_type,
              :access_times

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @fuel_type = data[:fuel_type]
    @access_times = data[:access_times]
  end
end