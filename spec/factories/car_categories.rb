FactoryBot.define do
  factory :car_category do
    name { 'Compacto' }
    daily_rate { 100 }
    car_insurance { 50 }
    third_party_insurance { 25 }
  end
end