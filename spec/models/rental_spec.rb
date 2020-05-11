require 'rails_helper'

RSpec.describe Rental, type: :model do
  it 'should generate a code on create' do
    customer = Customer.create!(name: 'José da Silva', 
                                email: 'teste@teste.com.br',
                                document: '095.950.470-23')
    car_category = CarCategory.create!(name: 'Compacto', daily_rate: '100',
                                      car_insurance: '30',
                                      third_party_insurance: '20')
    rental = Rental.new(start_date: 1.day.from_now, end_date: 2.days.from_now,
                        customer: customer, car_category: car_category)

    rental.save

    expect(rental.code).to_not be_blank
  end
end
