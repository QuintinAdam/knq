class Picture < ActiveRecord::Base
  enum category: [:memories, :engagement, :wedding, :the_ceremony, :our_reception, :the_dress, :bouquet, :honeymoon]
  belongs_to :user
  has_attached_file :photo, styles: { large: "600x600>", large_square: "500X500#", medium: "300x300>", medium_square: "200x200#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end

