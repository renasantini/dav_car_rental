require 'rails_helper'

describe CarCategory do
  context " #name" do
    it "cannot be blank" do
      car_category = CarCategory.new(name: '', daily_rate: '100', car_insurance: '30',
                                    third_party_insurance: '20')
      car_category.valid?
      expect(car_category.errors[:name]).to include('não pode ficar em branco')
    end

    it "must be unique" do
      CarCategory.create!(name: 'Compacto', daily_rate: '100', car_insurance: '30',
                          third_party_insurance: '20')
      car_category = CarCategory.new(name: 'Compacto', daily_rate: '120', car_insurance: '10',
                                      third_party_insurance: '30')
      car_category.valid?
      expect(car_category.errors[:name]).to include('já está em uso')
    end
  end
end
