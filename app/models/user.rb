class User < ActiveRecord::Base

  has_many :exports
  has_many :invoices
  
end
