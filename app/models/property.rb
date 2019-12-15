class Property < ApplicationRecord
  has_many :stations, inverse_of: :property, dependent: :destroy
  accepts_nested_attributes_for :stations, reject_if: :reject_stations, allow_destroy: true

  def reject_stations(attributes)
    exists = attributes[:id].present?
    empty = attributes[:route].blank?
    attributes.merge!(_destroy: 1) if exists && empty
    !exists && empty
  end

  validates :name, presence: true
  validates :rent, presence: true
  validates :address, presence: true
  validates :age, presence: true
  validates :note, presence: true
end
