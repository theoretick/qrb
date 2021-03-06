$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'path'
require 'qrb'
require 'qrb/syntax'

require 'coveralls'
Coveralls.wear!

class Color

  def initialize(r, g, b)
    @r, @g, @b = r, g, b
  end
  attr_reader :r, :g, :b

  def self.rgb(tuple)
    new(tuple[:r], tuple[:g], tuple[:b])
  end

  def to_rgb
    { r: @r, g: @g, b: @b }
  end

  def self.hex(s)
    Color.new *[1, 3, 5].map{|i| s[i, 2].to_i(16) }
  end

  def to_hex
    "#" << [r, g, b].map{|i| i.to_s(16) }.join
  end

  def ==(other)
    other.is_a?(Color) and other.to_rgb == self.to_rgb
  end

end

module ExternalContract
  def self.dress(x)
  end
  def self.undress(y)
  end
end

module SpecHelpers

  def intType
    Qrb::BuiltinType.new(Integer, "intType")
  end

  def floatType
    Qrb::BuiltinType.new(Float, "floatType")
  end

  def nilType
    Qrb::BuiltinType.new(NilClass, "nilType")
  end

  def byte
    Qrb::SubType.new(intType, byte: ->(i){ i>=0 && i<=255 })
  end

  def type_factory
    Qrb::TypeFactory.new
  end

  def system
    Qrb::System.new
  end

  def blueviolet
    Color.new(138, 43, 226)
  end

end

RSpec.configure do |c|
  c.include SpecHelpers
end
