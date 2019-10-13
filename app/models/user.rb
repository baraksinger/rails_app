class User < ActiveRecord::Base
  # attr. that MUST be present in the database 
  validates_presence_of :name, :lastname
end