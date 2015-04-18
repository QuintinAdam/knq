require "test_helper"

class PictureTest < ActiveSupport::TestCase

  def picture
    @picture ||= Picture.new
  end

  def test_valid
    assert picture.valid?
  end

end

# == Schema Information
#
# Table name: pictures
#
#  id                 :integer          not null, primary key
#  title              :string
#  category           :integer          default(0)
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
