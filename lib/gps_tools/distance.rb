class GPSTools::Distance
    def initialize(unit = "mile")
        @unit = unit
        case @unit
        when "mile"
            @earth_radius = 3958.8
        when "km"
            @earth_radius = 6378
        when "nm"
            @earth_radius = 3440.1 
        end
    end

    ##
    # Returns the distance in miles (unit = "mile"), kilometers (unit = "km"), or nautical miles (unit = "nm")
    # between two gps coordinates, coord1 and coord2
    def get_distance(coord1, coord2)
        lat1 = coord1[0]
        long1 = coord1[1]
        lat2 = coord2[0]
        long2 = coord2[1]

        lat_diff = lat2 - lat1
        long_diff = long2 - long1

        a = Math.sin(degrees_to_radians(lat_diff)/2) * Math.sin(degrees_to_radians(lat_diff)/2) + Math.sin(degrees_to_radians(long_diff)/2) * Math.sin(degrees_to_radians(long_diff)/2) * Math.cos(degrees_to_radians(lat1)) * Math.cos(degrees_to_radians(lat2))
        c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
        
        distance = @earth_radius * c
        return distance
    end

    private 
        def degrees_to_radians(degrees)
            degrees * Math::PI / 180
        end
end