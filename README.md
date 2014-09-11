# Greyn

Easily convert a PNG to greyscale. Just PNGs. Zero configuration.

## Installation

Add this line to your application's Gemfile:

    gem 'greyn'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install greyn

## Usage

    greyn path/to/image.png 

This will generate 3 new PNGs in the current directory: `image_luma.png`, `image_avg.png`, and `image_light.png`. Each image is generated using a different algorithm.

## Contributing

1. Fork it ( http://github.com/acurry/greyn/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
