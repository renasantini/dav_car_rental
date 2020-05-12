FactoryBot.define do
  factory :car_model do
    name { 'Uno' }
    year { 2020 }
    fuel_type { 'Flex' }
    motorization { '1.0' }
    manufacturer
    car_category
  end
end