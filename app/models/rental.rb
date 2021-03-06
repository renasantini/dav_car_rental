class Rental < ApplicationRecord
  belongs_to :customer
  belongs_to :car_category
  has_one :car_rental
  has_one :car, through: :car_rental

  validates :customer_id , :car_category_id, :end_date, :start_date, presence: true
  
  before_create :generate_code

  enum status: { scheduled: 0, ongoing: 5 }

  private

  def generate_code
    self.code = SecureRandom.alphanumeric(6).upcase
  end
end
