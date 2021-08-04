class Geometry
    def in_polygon?(polygon, coord)
        n = polygon.length

        # Polygon must have at least 3 points
        if n < 3
            return false
        end
        
        extreme_point = [10000, coord[1]]

        intersections = 0
        i = 0

        while i < n do
            if i == n -1
                next_point = polygon[0]
            else
                next_point = polygon[i+1]
            end

            if intersect?(polygon[i], next_point, coord, extreme_point)

                # Special case - catches case where point is on an edge
                # if lies on an edge, return true right away
                if orientation(polygon[i], coord, next_point) == 0 && on_segment(polygon[i], coord, next_point)
                    return true
                end

                intersections += 1
            end
            i += 1
        end

        # If odd number of intersections, we're good, if even, outside of polygon
        intersections % 2 == 1
    end

    private
        def max(a, b)
            a > b ? a : b
        end

        def min(a, b)
            a > b ? b : a
        end

        # Checks if point q is on the line between point p and point r
        def on_segment(p, q, r)
            q[0] <= max(p[0], r[0]) && q[0] >= min(p[0], r[0]) && q[1] <= max(p[1], r[1]) && q[1] >= min(p[1], r[1])
        end


        # Determine how three points are oriented relative to each other in given order
        # 0 => colinear
        # 1 => clockwise
        # 2 => counter-clockwise
        def orientation(p, q, r)
            val = ((q[1] - p[1]) * (r[0] - q[0])) - ((q[0] - p[0]) * (r[1] - q[1]))

            # If above calculation is exactly 0, the three points must be colinear
            if val == 0
                return 0
            else
                # Positive value from above calculation means oriented clockwise
                if val > 0
                    return 1
                # PNegative value from above calculation means oriented counter-clockwise
                else
                    return 2
                end
            end
        end

        # Check if two lines (p1q1 and p2q2) intersect
        # This is used to determine if a point is within a polygon
        def intersect?(p1, q1, p2, q2)
            # We need to look at 4 different orientations to determine intersection
            o1 = orientation(p1, q1, p2)
            o2 = orientation(p1, q1, q2)
            o3 = orientation(p2, q2, p1)
            o4 = orientation(p2, q2, q1)

            # General case - if these two pairs are both unequal, we know we have an intersection
            if o1 != o2 && o3 != o4
                return true
            end

            # Edge cases
            if (o1 == 0 && on_segment(p1, p2, q1)) || (o2 == 0 && on_segment(p1, q2, q1)) || (o3 == 0 && on_segment(p2, p1, q2)) || (o4 == 0 && on_segment(p2, q1, q2))
                return true
            end

            return false
        end
end
