require 'rails_helper'

describe Subsidiary, type: :model do
  context " #name" do
    it "cannot be blank" do
      subsidiary = Subsidiary.new(name: '', cnpj: '32.685.705/0001-86', address: 'Av. Imperatriz Dona Tereza Cristina, 11')
      subsidiary.valid?
      expect(subsidiary.errors[:name]).to include('não pode ficar em branco')
    end

    it "must be unique" do
      Subsidiary.create!(name: 'Campinas', cnpj: '32.685.705/0001-86', address: 'Av. Imperatriz Dona Tereza Cristina, 11')
      subsidiary = Subsidiary.new(name: 'Campinas', cnpj: '76.415.862/0001-47', address: 'Praça Dr. Francisco Ursaia, 1900')
      subsidiary.valid?
      expect(subsidiary.errors[:name]).to include('já está em uso')
    end
  end

  context " #CNPJ" do
    it 'cannot be blank' do
      subsidiary = Subsidiary.new(name: 'Campinas', cnpj: '', address: 'Av. Imperatriz Dona Tereza Cristina, 11')
      subsidiary.valid?
      
      expect(subsidiary.errors[:cnpj]).to include('não pode ficar em branco')
    end

    it 'must be unique' do
      Subsidiary.create!(name: 'Campinas', cnpj: '32.685.705/0001-86', address: 'Av. Imperatriz Dona Tereza Cristina, 11')
      subsidiary = Subsidiary.new(name: 'Campinas 2', cnpj: '32.685.705/0001-86', address: 'Praça Dr. Francisco Ursaia, 1900')
      subsidiary.valid?
      expect(subsidiary.errors[:cnpj]).to include('já está em uso')
    end

    it 'must be valid' do
      subsidiary = Subsidiary.new(name: 'Campinas 2', cnpj: '00.000.000/0000-00', address: 'Praça Dr. Francisco Ursaia, 1900')
      subsidiary.valid?
      expect(subsidiary.errors[:cnpj]).to include('não é válido')
    end

    it 'must be formatted' do
      subsidiary = Subsidiary.new(name: 'Campinas 2', cnpj: '32685705/0001-86', address: 'Praça Dr. Francisco Ursaia, 1900')
      subsidiary.valid?
      expect(subsidiary.errors[:cnpj]).to include('não é válido')
    end
  end

  context " #address" do
    it 'cannot be blank' do
      subsidiary = Subsidiary.new(name: 'Campinas', cnpj: '32.685.705/0001-86', address: '')
      subsidiary.valid?
      
      expect(subsidiary.errors[:address]).to include('não pode ficar em branco')
    end

    it 'must be unique' do
      Subsidiary.create!(name: 'Campinas', cnpj: '32.685.705/0001-86', address: 'Av. Imperatriz Dona Tereza Cristina, 11')
      subsidiary = Subsidiary.new(name: 'Campinas 2', cnpj: '76.415.862/0001-47', address: 'Av. Imperatriz Dona Tereza Cristina, 11')
      subsidiary.valid?
      expect(subsidiary.errors[:address]).to include('já está em uso')
    end
    
  end
  
end
