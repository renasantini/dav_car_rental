class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :car_category
  validates :customer_id , :car_category_id, :end_date, :start_date, presence: true
end
