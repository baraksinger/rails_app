class User < ActiveRecord::Base

  # attr. that MUST be present in the database and must be of specified length
  validates :name,     presence: true, length: {minimum: 2, maximum: 50}
  validates :lastname, presence: true, length: {minimum: 2, maximum: 50}
  validates :email, presence: true
end