class User < ApplicationRecord
  
  belongs_to :company, optional: true # Need to include optional: true so that validation can be passed when creating the user and company at same time
  has_many :transactions
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  
  ############################
  #     Instance Methods     #
  ############################
  
  def full_name
   "#{first_name} #{last_name}"
  end
  
  ############################
  #     Class Methods        #
  ############################
  
end
