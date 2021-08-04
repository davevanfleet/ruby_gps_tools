describe Geometry do
    before do
        @geometry = Geometry.new
    end

    describe "in_polygon?" do
        before do
            @polygon = [[0, 0], [0, 2], [2, 2], [2, 0]]
        end

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

    describe "in_radius?" do
        it "returns true for point within radius" do
            expect(@geometry.in_radius?(300, [42.346033, -71.097871], [40.829273, -73.927415])).to be(true)
        end

        it "returns false for point outside radius" do
            expect(@geometry.in_radius?(10, [42.346033, -71.097871], [40.829273, -73.927415])).to be(false)
        end
    end
end