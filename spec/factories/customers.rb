FactoryBot.define do
  factory :customer do
    name { 'José da Silva' }
    document { CPF.generate(formated: true) }
    sequence(:email) { |n| "customer#{n}@test.com.br" }
  end
end