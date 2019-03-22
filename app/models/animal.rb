class Animal < ApplicationRecord
  has_many :sightings
  validates :common_name, :latin_name, :kingdom, presence: true
  validates :common_name, :latin_name, uniqueness: true
  validates :common_name, :latin_name, :kingdom, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/, message: "should contain only letters!"}
end
