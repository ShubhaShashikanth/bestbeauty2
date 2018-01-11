class Category < ApplicationRecord 
  acts_as_tree order: 'created_at DESC'
  has_many :products, dependent: :destroy
end
