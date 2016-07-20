class Transaction < ApplicationRecord
  
  belongs_to :user
  belongs_to :customer
  has_many :commodity_items
  accepts_nested_attributes_for :commodity_items, allow_destroy: true, :reject_if => :all_blank
  has_many :attachments, as: :attached_item, dependent: :destroy
  accepts_nested_attributes_for :attachments, allow_destroy: true, :reject_if => :all_blank
  
  before_save :compute_total
  
  ############################
  #     Instance Methods     #
  ############################
  
  def sub_total
    sum = 0
    commodity_items.each do |commodity_item|
      sum = sum + commodity_item.commodity.price
    end
    return sum
  end
  
  def compute_total
    total = sub_total - discount - tax_amount
    self.total = total
  end
  
  def tax_as_decimal
    tax/100
  end
  
  def tax_amount
    (sub_total - discount) * tax_as_decimal
  end
  
  ############################
  #     Class Methods        #
  ############################
  
end
