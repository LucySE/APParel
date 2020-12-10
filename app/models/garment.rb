class Garment < ApplicationRecord
  belongs_to :user
  has_many :photos
  attribute :claimed, :boolean, default: false
end
