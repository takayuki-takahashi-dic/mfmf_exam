class Property < ApplicationRecord
  has_many :stations, inverse_of: :property
  accepts_nested_attributes_for :stations

  validates :name, presence: true
  validates :rent, presence: true
  validates :address, presence: true
  validates :age, presence: true
  validates :note, presence: true
end
