require 'greyn/version'
require 'greyscale'
require 'chunky_png'

#
# Greyn - convert color images to greyscale.
#
# @author [andrew.d.curry@gmail.com]
#
module Greyn
  ###############
  ## CONSTANTS ##
  ###############
  TYPES = [:avg, :light, :luma].freeze

  ###################
  ## CLASS METHODS ##
  ###################
  class << self
    #
    # Parse filename.
    # 'family_photo_1.png' => 'family_photo_1'
    # @param file [String] filename of an image
    #
    # @return [String]
    def base_filename(file)
      File.basename(file).split('.')[0]
    end

    #
    # Convert an image to greyscale.
    # @param file [String] image filename
    #
    # @return [void]
    def convert(file)
      basename = base_filename(file)

      path = File.dirname(File.expand_path(file))

      TYPES.each do |type|
        image = ChunkyPNG::Image.from_file(File.expand_path(file))

        Greyscale.greyscale(image, type)

        image.save("#{path}/#{basename}_#{type}.png")
      end
    end
  end
end
