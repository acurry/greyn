require "greyn/version"
require "greyscale"
require "chunky_png"

module Greyn
  
  def self.base_filename file
    File.basename(file).split('.')[0]
  end

  def self.convert file
    basename = self.base_filename file
    path = File.dirname(File.expand_path(file))

    [:avg, :light, :luma].each do |f|
      img = ChunkyPNG::Image::from_file(File.expand_path(file))
      Greyscale::greyscale(img, f)
      img.save("#{path}/#{basename}_#{f}.png")
    end
  end

end
