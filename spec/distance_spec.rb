describe Distance do
    describe "get_distance" do
        it "calculates the correct distance in miles" do
            distance = Distance.new
            fenway_to_yankee_stadium = distance.get_distance([42.346033, -71.097871], [40.829273, -73.927415])
            expect(fenway_to_yankee_stadium.round(2)).to eq(179.89)
        end

        it "calculates the correct distance in kilometers" do
            distance = Distance.new(unit="km")
            fenway_to_yankee_stadium = distance.get_distance([42.346033, -71.097871], [40.829273, -73.927415])
            expect(fenway_to_yankee_stadium.round(2)).to eq(289.81)
        end
    end
end