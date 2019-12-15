class Station < ApplicationRecord
  belongs_to :property, inverse_of: :stations

  validates :route, presence: true
  validates :name, presence: true
  validates :time_needed, presence: true

end
