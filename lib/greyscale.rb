require 'chunky_png'

#
# Logic for converting a color pixels' RGB to greyscale.
#
# @author [andrew.d.curry@gmail.com]
#
module Greyscale
  class << self
    #
    # Compute luma-based greyscale value for an RGB pixel.
    # @param red [Integer]
    # @param green [Integer]
    # @param blue [Integer]
    #
    # @return [Integer]
    def luma(red, green, blue)
      (0.21 * red) + (0.72 * green) + (0.07 * blue)
    end

    #
    # Compute average greyscale value for an RGB pixel.
    # @param red [Integer]
    # @param green [Integer]
    # @param blue [Integer]
    #
    # @return [Integer]
    def avg(red, green, blue)
      (red + green + blue) / 3
    end

    #
    # Compute light-based greyscale value for an RGB pixel.
    # @param red [Integer]
    # @param green [Integer]
    # @param blue [Integer]
    #
    # @return [Integer]
    def light(red, green, blue)
      max = [red, green, blue].max
      min = [red, green, blue].min

      (max + min) / 2
    end

    #
    # Convert an image from RGB to greyscale using type algorithm.
    # @param image [ChunkyPNG::Image]
    # @param type [Symbol] one of :avg, :luma, or :light
    #
    # @return [type] [description]
    def greyscale(image, type)
      (0...image.width).each do |x|
        (0...image.height).each do |y|
          pixel = image[x, y]

          rgb_values = [
            ChunkyPNG::Color.r(pixel),
            ChunkyPNG::Color.g(pixel),
            ChunkyPNG::Color.b(pixel)
          ]
          color = send(type, *rgb_values).to_i

          image[x, y] = ChunkyPNG::Color.rgb(color, color, color)
        end
      end
    end
  end
end
