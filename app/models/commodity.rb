class Commodity < ApplicationRecord
  
  belongs_to :company
  has_many :commodity_items
  
  ############################
  #     Instance Methods     #
  ############################
  
  
  
  ############################
  #     Class Methods        #
  ############################
  
end
