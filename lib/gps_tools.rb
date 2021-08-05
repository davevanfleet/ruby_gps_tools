class GPSTools
    ##
    # Returns the distance in miles (unit = "mile"), kilometers (unit = "km"), or nautical miles (unit = "nm")
    # between two gps coordinates, coord1 and coord2
    def self.distance(coord1, coord2, unit = "mile")
        distance_tool = Distance.new(unit)
        distance = distance_tool.get_distance(coord1[0], coord1[1], coord2[0], coord2[1])
        return distance
    end

    ##
    # Returns a boolean that identifies if a given gps coordinate, coord, is within
    # a given polygon (array of [lat, lng])
    def self.in_polygon?(polygon, coord)
        geometry = Geometry.new()
        return geometry.in_polygon?(polygon, coord)
    end

    ##
    # Returns a new array containing all coordinates within the given polygon
    def self.filter_by_polygon(polygon, coords)
        geometry = Geometry.new()
        return geometry.filter_by_polygon(polygon, coords)
    end

    ##
    # Returns a boolean that identifies if a given gps coordinate, coord, is within
    # a given radius of a center point, center
    def self.in_radius?(radius, center, coord)
        geometry = Geometry.new()
        return geometry.in_radius?(radius, center, coord)
    end

    ##
    # Returns a new array containing all coordinates within the given radius
    def self.filter_by_radius(radius, center, coords)
        geometry = Geometery.new()
        return geometry.filter_by_radius(radius, center, coords)
    end
end

require 'gps_tools/distance'
require 'gps_tools/geometry'