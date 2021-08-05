describe GPSTools::Geometry do
    before do
        @geometry = GPSTools::Geometry.new
        @polygon = [[0, 0], [0, 2], [2, 2], [2, 0]]
        @coords = [[1, 1], [10, 10], [0, 1], [1, 0]]
    end

    describe "in_polygon?" do
        it "identifies point within polygon" do
            expect(@geometry.in_polygon?(@polygon, [1, 1])).to be(true)
        end

        it "identifies point outside polygon" do
            expect(@geometry.in_polygon?(@polygon, [10, 10])).to be(false)
        end

        it "identifies point on middle edge of polygon" do
            expect(@geometry.in_polygon?(@polygon, [0, 1])).to be(true)
        end

        it "identifies point on last edge of polygon" do
            expect(@geometry.in_polygon?(@polygon, [1, 0])).to be(true)
        end
    end

    describe "filter_by_polygon" do
        before do
            @result = @geometry.filter_by_polygon(@polygon, @coords)
        end

        it "returns a new array" do
            expect(@result).to be_instance_of(Array)
        end

        it "includes coords inside polygon" do
            expect(@result.include?([1, 1])).to be(true)
            expect(@result.include?([0, 1])).to be(true)
            expect(@result.include?([1, 0])).to be(true)

        end

        it "doesn't include coords outside polygon" do
            expect(@result.include?([10, 10])).to be(false)
        end
    end

    describe "in_radius?" do
        it "returns true for point within radius" do
            expect(@geometry.in_radius?(300, [42.346033, -71.097871], [40.829273, -73.927415])).to be(true)
        end

        it "returns false for point outside radius" do
            expect(@geometry.in_radius?(10, [42.346033, -71.097871], [40.829273, -73.927415])).to be(false)
        end
    end

    describe "filter_by_radius" do
        before do
            @result = @geometry.filter_by_radius(300, [42.346033, -71.097871], [[40.829273, -73.927415], [40.829273, 1]])
        end

        it "returns a new array" do
            expect(@result).to be_instance_of(Array)
        end

        it "includes coords within the radius" do
            expect(@result.include?([40.829273, -73.927415])).to be(true)
        end

        it "doesn't include coords outside the radius" do
            expect(@result.include?([40.829273, 1])).to be(false)
        end
    end
end