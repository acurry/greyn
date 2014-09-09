require "greybeard/version"
require "greyscale"
require "chunky_png"

module Greybeard
  
  def self.base_filename file
    File.basename(file).split('.')[0]
  end

  def self.convert file
    basename = self.base_filename file

    [:avg, :light, :luma].each do |f|
      img = ChunkyPNG::Image::from_file(File.expand_path(file))
      Greyscale::greyscale(img, f)
      img.save("./#{basename}_#{f}.png")
    end
  end

end
