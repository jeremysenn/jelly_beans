class CommodityItem < ApplicationRecord
  
  belongs_to :commodity
  belongs_to :txn, class_name: 'Transaction', foreign_key: "transaction_id", optional: true
  
  ############################
  #     Instance Methods     #
  ############################
  
  def net
    ("#{gross.blank? ? 0 : gross}".to_d - "#{tare.blank? ? 0 : tare}".to_d)
  end
  
  ############################
  #     Class Methods     #
  ############################
  
end
