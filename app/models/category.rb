class Category < ApplicationRecord 
  acts_as_tree order: 'created_at DESC' #to tell the model that its nested
  has_many :products, dependent: :destroy #to define the relationship between the models Category and Product
end
