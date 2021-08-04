require 'gps_tools/distance'
require 'gps_tools/geometry'

class GPSTools
    def self.distance(coord1, coord2, unit = "mile")
        distance_tool = Distance.new(unit)
        return distance_tool.get_distance(coord1[0], coord1[1], coord2[0], coord2[1])
    end

    def self.in_polygon?(polygon, coord)
        geometry = Geometry.new()
        return geometry.in_polygon?(polygon, coord)
    end
end