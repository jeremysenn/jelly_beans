class Customer < ApplicationRecord
  
  belongs_to :company
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  
  ############################
  #     Instance Methods     #
  ############################
  
  def full_name
   "#{first_name} #{last_name}"
  end
  
  #############################
  #     Class Methods         #
  #############################
  
end
