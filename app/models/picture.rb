class Picture < ActiveRecord::Base
  enum category: [:memories, :engagement, :rehearsal_dinner, :wedding] # , :wedding, :the_ceremony, :our_reception, :the_dress, :bouquet, :honeymoon
  belongs_to :user
  has_attached_file :photo, styles: { large: "600x600>", large_square: "500X500#", medium: "300x300>", medium_square: "200x200#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  validates :category, presence: true
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
