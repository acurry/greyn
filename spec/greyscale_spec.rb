require 'greyscale'

test_greyscale_pixels = {
  luma: [
    255,
    892_679_679,
    3_082_270_719,
    286_331_391
  ],
  avg: [
    255,
    1_431_655_935,
    1_431_655_935,
    1_431_655_935
  ],
  light: [
    255,
    2_139_062_271,
    2_139_062_271,
    2_139_062_271
  ]
}

describe Greyscale do
  it 'computes the luma value' do
    expect(subject.luma(1, 1, 1)).to eq 1.0
  end

  it 'computes the avg value' do
    expect(subject.avg(1, 1, 1)).to eq 1.0
  end

  it 'computes the light value' do
    expect(subject.light(3, 2, 1)).to eq 2.0
  end

  [:luma, :avg, :light].each do |type|
    it "computes the greyscale of an image using #{type}" do
      file = File.expand_path('./spec/greyscale_spec_test.png')

      orig = ChunkyPNG::Image.from_file(file)

      Greyscale.greyscale(orig, type)

      expect(orig.pixels).to match_array(test_greyscale_pixels[type])
    end
  end
end
