require "test_helper"

class BitfieldTest < Minitest::Test
  def setup
    @subject = Bitfield.new(1000)
  end

  def test_that_it_has_a_version_number
    refute_nil ::Bitfield::VERSION
  end

  def test_basic
    assert_equal false, Bitfield.new(100).get(0)
    assert_equal false, Bitfield.new(100).get(1)
  end

  def test_setting_and_unsetting
    @subject.set 100
    assert_equal true, @subject.get(100)
    @subject.unset 100
    assert_equal false, @subject.get(100)
  end

  def test_random_subset
    idxes = []
    100.times {idxes << rand(1000)}
    idxes.each {|index| @subject.set index}
    1000.times.each do |index|
      assert_equal(@subject.get(index), idxes.include?(index))
    end
    idxes.each {|index| @subject.unset index}
    1000.times.each do |index|
      assert_equal(@subject.get(index), false)
    end
  end

end