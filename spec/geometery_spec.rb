describe Geometry do
    describe "in_polygon?" do
        before do
            @polygon = [[0, 0], [0, 2], [2, 2], [2, 0]]
            @geometry = Geometry.new
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
end