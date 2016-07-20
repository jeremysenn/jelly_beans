class Company < ApplicationRecord
  
  has_many :users
  accepts_nested_attributes_for :users , :reject_if => :all_blank, allow_destroy: true
  has_many :commodities
  has_many :customers
  has_many :transactions, through: :users
  has_many :commodity_items, through: :transactions
  
  validates :name, presence: true
  
  ############################
  #     Instance Methods     #
  ############################
  
  
  
  ############################
  #     Class Methods        #
  ############################
end
