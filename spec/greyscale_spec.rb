require 'greyscale'

test_greyscale_pixels = {
    :luma => [255, 892679679, 3082270719, 286331391],
    :avg => [255, 1431655935, 1431655935, 1431655935],
    :light => [255, 2139062271, 2139062271, 2139062271]
}

describe Greyscale do
    it "computes the luma value" do
        expect(subject::luma(1, 1, 1)).to eq 1.0    
    end

    it "computes the avg value" do
        expect(subject::avg(1,1,1)).to eq 1.0
    end

    it "computes the light value" do
        expect(subject::light(3,2,1)).to eq 2.0
    end

    [:luma, :avg, :light].each do |f|
        it "computes the greyscale of an image using #{f.to_s}" do
            orig = ChunkyPNG::Image.from_file(File.expand_path('./spec/greyscale_spec_test.png'))
            Greyscale::greyscale(orig, f)

            expect(orig.pixels).to match_array(test_greyscale_pixels[f])
        end
    end
end