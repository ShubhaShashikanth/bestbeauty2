class Product < ApplicationRecord
  belongs_to :category #to define the validations between the models Category and Product
  validates :name, :description, presence: true #All these are validations
  validates :price, presence: true
  validates :name, uniqueness: true
  has_attached_file :image, style: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.jpg", validate_media_type: false 
  #paperclip validation
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/ #paperclip validation
end
