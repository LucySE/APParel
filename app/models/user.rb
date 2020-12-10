class User < ApplicationRecord
  has_many :garments


  # Use the bcrypt gem to encrypt passwords when users create accounts,
  # and store only the encrypted version in the 'users' table
  has_secure_password

  # Model validations: ActiveRecord will perform
  # these checks before any create or update
  after_validation :geocode

  geocoded_by :address

  # Email can't be empty, and must be unique
  # validates :email, presence: true, uniqueness: true

  # validates :name, length: { minimum: 2 }

end
