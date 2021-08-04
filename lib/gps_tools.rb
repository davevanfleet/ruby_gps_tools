class GPSTools
    ##
    # Returns the distance in miles (unit = "mile"), kilometers (unit = "km"), or nautical miles (unit = "nm")
    # between two gps coordinates, coord1 and coord2
    def self.distance(coord1, coord2, unit = "mile")
        distance_tool = Distance.new(unit)
        return distance_tool.get_distance(coord1[0], coord1[1], coord2[0], coord2[1])
    end

    ##
    # Returns a boolean that identifies if a given gps coordinate, coord, is within
    # a given polygon (array of [lat, lng])
    def self.in_polygon?(polygon, coord)
        geometry = Geometry.new()
        return geometry.in_polygon?(polygon, coord)
    end
end

require 'gps_tools/distance'
require 'gps_tools/geometry'