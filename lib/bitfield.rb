
class Bitfield
  VERSION = "0.1.0"
  class LengthError < StandardError
    def initialize(expected, actual)
      @expected, @actual = expected, actual
    end

    def message
      "Invalid filter provided was (#{actual} bytes instead of #{expected} bytes."
    end
  end

  def initialize(length_in_bits, content=nil)
    length_in_bytes = length_in_bits / 8
    @bits = content || (0.chr * length_in_bytes)
    raise LengthError.new(length_in_bytes, bits.length)  if length_in_bytes && length_in_bytes != bits.length
  end

  def set(idx)
    find(idx) do |chr, mask|
      bits[chr] = (bits[chr].ord | mask).chr
    end
  end

  def unset(idx)
    find(idx) do |chr, mask|
      unmask = 255 ^ mask
      bits[chr] = (bits[chr].ord & unmask).chr
    end
  end

  def get(idx)
    find(idx) do |chr, mask|
      (bits[chr].ord & mask) == mask
    end
  end

  def serialize(path, verbose=false)
    File.write(path, bits)
  end

  def self.deserialize(path, size)
    new(size, File.binread(path))
  end

  private

  attr_reader :bits

  def find(idx)
    chr, mask = idx / 8, 2**(idx % 8)
    raise "Unexpected chr size #{chr.size}, expected 8" unless chr.size == 8
    raise "Unexpected mask size #{mask.size}, expected 8" unless mask.size == 8

    yield chr, mask
  end
end
