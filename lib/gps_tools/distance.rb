class Distance
    def initialize(unit)
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

    def get_distance(lat1, long1, lat2, long2)
        lat_diff = degrees_to_radians(lat2 - lat1)
        long_diff = degrees_to_radians(long2 - long1)

        a = (Math.sin(lat_diff/2) * Math.sin(lat_diff/2)) + (Math.sin(long_diff/2) * Math.sin(long_diff/2) * Math.cos(lat1) * Math.cos(lat2))
        c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
        
        return @earth_radius * c
    end

    private 
        def degrees_to_radians(degrees)
            degrees * Math::PI / 180
        end
end