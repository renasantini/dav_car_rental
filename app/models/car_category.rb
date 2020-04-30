class CarCategory < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates_numericality_of :daily_rate, :car_insurance, :third_party_insurance,
                             greater_than_or_equal_to: 0
  has_many :car_models
end
