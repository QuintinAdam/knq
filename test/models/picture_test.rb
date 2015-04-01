require "test_helper"

class PictureTest < ActiveSupport::TestCase

  def picture
    @picture ||= Picture.new
  end

  def test_valid
    assert picture.valid?
  end

end
