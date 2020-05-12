class CarModel < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :car_category
  has_many :cars
  validates :name, presence: true, uniqueness: true
  validates :year, :motorization, :fuel_type, :manufacturer_id, :car_category_id,
            presence: true
end
