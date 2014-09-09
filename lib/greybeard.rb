require "greybeard/version"
require "greyscale"
require "chunky_png"

module Greybeard
  
  def self.base_filename file
    File.basename(file).split('.')[0]
  end

  def self.to_luma file
    basename = self.base_filename file
    img = ChunkyPNG::Image::from_file(File.expand_path(file))
    Greyscale::greyscale(img, :col_luma)
    img.save("./#{basename}_luma.png")
  end
  
end
