require 'rails_helper'

describe CarModel do
  context " #name" do
    it "cannot be blank" do
      manufacturer = Manufacturer.create!(name: 'Chevrolet')
      car_category = CarCategory.create!(name: 'Compacto', daily_rate: 100, 
                                       car_insurance: 20, 
                                       third_party_insurance: 10)
      car_model = CarModel.new(name: '', year: '2020', motorization: '203',
                                fuel_type: 'Elétrico', manufacturer_id: manufacturer.id,
                                car_category_id: car_category.id)
      
      car_model.valid?
      
      expect(car_model.errors[:name]).to include('não pode ficar em branco')
    end

    it "must be unique" do
      manufacturer = Manufacturer.create!(name: 'Chevrolet')
      car_category = CarCategory.create!(name: 'Compacto', daily_rate: 100, 
                                       car_insurance: 20, 
                                       third_party_insurance: 10)
      CarModel.create!(name: 'Bolt', year: '2020', motorization: '203',
                      fuel_type: 'Elétrico', manufacturer_id: manufacturer.id,
                      car_category_id: car_category.id)
      
      car_model = CarModel.new(name: 'Bolt', year: '2021', motorization: '210',
                                fuel_type: 'Elétrico', manufacturer_id: manufacturer.id,
                                car_category_id: car_category.id)
      
      car_model.valid?
      
      expect(car_model.errors[:name]).to include('já está em uso')
    end
  end

  context " #year" do
    it "cannot be blank" do
      manufacturer = Manufacturer.create!(name: 'Chevrolet')
      car_category = CarCategory.create!(name: 'Compacto', daily_rate: 100, 
                                       car_insurance: 20, 
                                       third_party_insurance: 10)
      car_model = CarModel.new(name: 'Bolt', year: '', motorization: '203',
                                fuel_type: 'Elétrico', manufacturer_id: manufacturer.id,
                                car_category_id: car_category.id)
      
      car_model.valid?
      
      expect(car_model.errors[:year]).to include('não pode ficar em branco')
    end
  end

  context " #motorization" do
    it "cannot be blank" do
      manufacturer = Manufacturer.create!(name: 'Chevrolet')
      car_category = CarCategory.create!(name: 'Compacto', daily_rate: 100, 
                                       car_insurance: 20, 
                                       third_party_insurance: 10)
      car_model = CarModel.new(name: 'Bolt', year: '2020', motorization: '',
                                fuel_type: 'Elétrico', manufacturer_id: manufacturer.id,
                                car_category_id: car_category.id)
      
      car_model.valid?
      
      expect(car_model.errors[:motorization]).to include('não pode ficar em branco')
    end
  end

  context " #fuel_type" do
    it "cannot be blank" do
      manufacturer = Manufacturer.create!(name: 'Chevrolet')
      car_category = CarCategory.create!(name: 'Compacto', daily_rate: 100, 
                                       car_insurance: 20, 
                                       third_party_insurance: 10)
      car_model = CarModel.new(name: 'Bolt', year: '2020', motorization: '203',
                                fuel_type: '', manufacturer_id: manufacturer.id,
                                car_category_id: car_category.id)
      
      car_model.valid?
      
      expect(car_model.errors[:fuel_type]).to include('não pode ficar em branco')
    end
  end

  context " #manufacturer" do
    it "cannot be blank" do
      car_category = CarCategory.create!(name: 'Compacto', daily_rate: 100, 
                                       car_insurance: 20, 
                                       third_party_insurance: 10)
      car_model = CarModel.new(name: 'Bolt', year: '2020', motorization: '203',
                                fuel_type: 'Elétrico', manufacturer_id: '',
                                car_category_id: car_category.id)
      
      car_model.valid?
      
      expect(car_model.errors[:manufacturer_id]).to include('não pode ficar em branco')
    end
  end

  context " #car_category" do
    it "cannot be blank" do
      manufacturer = Manufacturer.create!(name: 'Chevrolet')
      car_model = CarModel.new(name: 'Bolt', year: '2020', motorization: '203',
                                fuel_type: 'Elétrico', manufacturer_id: manufacturer.id,
                                car_category_id: '')
      
      car_model.valid?
      
      expect(car_model.errors[:car_category_id]).to include('não pode ficar em branco')
    end
  end
end
