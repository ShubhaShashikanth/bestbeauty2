class Product < ApplicationRecord
  belongs_to :category
  validates :name, :description, presence: true
  validates :price, presence: true
  validates :name, uniqueness: true
  has_attached_file :image, style: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.jpg", validate_media_type: false 

   validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
